<#
.SYNOPSIS
    Generates SHA-256 checksum files for Z+ release artifacts.

.DESCRIPTION
    For every file in the target directory (excluding checksum artifacts
    from previous runs), this script writes:

      - a per-file sidecar:      <name>.sha256
      - a checksum manifest:     SHA256SUMS.txt        (sha256sum -c compatible)
      - a metadata manifest:     release-manifest.json

    Output files are written as plain ASCII with LF line endings, so the
    results behave identically to the GitHub Actions "Release checksums"
    workflow. Re-running the script over the same directory is safe:
    previously generated checksum files are skipped and then overwritten.

.EXAMPLE
    .\tools\New-Checksums.ps1 -Path .\dist -ReleaseTag v1.3.5

.NOTES
    Verify the results with:
      Get-Content .\SHA256SUMS.txt
      Get-FileHash .\<asset> -Algorithm SHA256
#>
[CmdletBinding()]
param(
    # Directory containing the release assets to hash.
    [Parameter(Mandatory = $true)]
    [string]$Path,

    # Optional release tag recorded in release-manifest.json (e.g. v1.3.5).
    [Parameter(Mandatory = $false)]
    [string]$ReleaseTag
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
    throw "Directory not found: $Path"
}

$directory = (Resolve-Path -LiteralPath $Path).ProviderPath
$ascii = [System.Text.Encoding]::ASCII

$files = Get-ChildItem -LiteralPath $directory -File |
    Where-Object {
        $_.Name -ne 'SHA256SUMS.txt' -and
        $_.Name -ne 'release-manifest.json' -and
        $_.Name -notlike '*.sha256'
    } |
    Sort-Object -Property Name

if (-not $files) {
    throw "No release artifacts found in: $directory"
}

$records = @()

foreach ($file in $files) {
    $hash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
    $records += [pscustomobject]@{
        name   = $file.Name
        size   = $file.Length
        sha256 = $hash
    }

    $sidecar = '{0}  {1}' -f $hash, $file.Name
    [System.IO.File]::WriteAllText(
        (Join-Path $directory ($file.Name + '.sha256')),
        $sidecar + "`n",
        $ascii)

    Write-Host ("hashed {0}" -f $file.Name)
}

$sums = ($records | ForEach-Object { '{0}  {1}' -f $_.sha256, $_.name }) -join "`n"
[System.IO.File]::WriteAllText(
    (Join-Path $directory 'SHA256SUMS.txt'),
    $sums + "`n",
    $ascii)

$manifest = [ordered]@{}
if ($ReleaseTag) {
    $manifest['release'] = $ReleaseTag
}
$manifest['algorithm'] = 'SHA-256'
$manifest['generated_utc'] = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
$manifest['artifacts'] = @($records)

$json = $manifest | ConvertTo-Json -Depth 4
[System.IO.File]::WriteAllText(
    (Join-Path $directory 'release-manifest.json'),
    $json + "`n",
    $ascii)

Write-Host ""
Write-Host "Wrote checksum files to $directory :"
Write-Host "  - one .sha256 sidecar per artifact"
Write-Host "  - SHA256SUMS.txt"
Write-Host "  - release-manifest.json"
