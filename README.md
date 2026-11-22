# Z+ Releases

**Official releases and downloadable builds of the Z+ programming language.**

Z+ is a programming language designed to make programming approachable while providing access to more advanced language features, libraries, and native execution.

This repository contains official compiled releases of Z+. It is separate from the main development source code.

Current official builds target **Windows x86_64**.

## Latest Release

<!-- Update this table with each new release. -->

**Z+ 1.3.5** (November 21, 2026) — [Download the installer](https://github.com/MiroXdev0/ZPluse-release/releases/latest)

| | |
|---|---|
| Version | 1.3.5 |
| Platform | Windows x86_64 |
| Installer | `ZPlus-1.3.5-Setup.exe` (7.08 MB) |
| SHA-256 | `08411f883717a62640fd0dda7f3272bc823f540f2ad1a3761e601b1c38026d6f` |
| Release notes | [v1.3.5](https://github.com/MiroXdev0/ZPluse-release/releases/tag/v1.3.5) |

## Downloads

**Latest stable release:** [View Releases](https://github.com/MiroXdev0/ZPluse-release/releases/latest)

Download the installer or other available assets from the corresponding GitHub Release.

Each release includes its own version tag, release notes, and available download files.

## Versioning

Z+ uses semantic versioning:

`MAJOR.MINOR.PATCH`

For example:

- `1.3.5` - Current release
- `1.3.4` - Previous release
- `1.3.0` - Older release

Git tags use the `v` prefix:

- `v1.3.5`
- `v1.3.4`
- `v1.3.0`

Older releases remain available so users can access previous versions when needed.

## Installation

For Windows:

1. Open the [Releases page](https://github.com/MiroXdev0/ZPluse-release/releases).
2. Select the version you want.
3. Download the Windows installer.
4. Run the installer and follow its instructions.
5. Open a terminal and verify the installation:

```powershell
zp --version
```

If the release includes ZPBuild, you can also check it with:

```powershell
zpbuild --version
```

Check the individual release notes for platform-specific instructions and included components.

## Verifying Downloads

Current and future releases include SHA-256 checksum files: a per-file `<name>.sha256` sidecar, a `SHA256SUMS.txt` manifest, and a `release-manifest.json` describing each artifact. Older releases may publish the hash only in the release notes.

To calculate a file's SHA-256 hash on Windows:

```powershell
Get-FileHash .\ZPlus-1.3.5-Setup.exe -Algorithm SHA256
```

To view the published checksum for the same file:

```powershell
Get-Content .\ZPlus-1.3.5-Setup.exe.sha256
```

Compare the resulting hash with the value published in the matching checksum file or in the corresponding release's notes.

Only download Z+ from this repository or another explicitly linked official Z+ distribution channel.

## Security and Antivirus Notices

Some security products may flag unfamiliar or unsigned executables.

The Windows installer and binaries may be distributed without an Authenticode signature when a trusted code-signing certificate is unavailable.

An antivirus detection is not automatically proof of malware, but it should not be ignored.

If you encounter a detection:

- Record the antivirus product and exact detection name.
- Identify which downloaded file triggered it.
- Report the result through the repository's Issues page.
- Do not disable antivirus protection simply to install Z+.

No antivirus vendor clearance is claimed unless explicitly documented.

See [SECURITY.md](SECURITY.md) for the full security policy.

## Project Links

- **Website:** https://zpluse.vercel.app/
- **Releases:** https://github.com/MiroXdev0/ZPluse-release/releases
- **Source and development:** https://github.com/MiroXdev0

## Reporting Issues

Use the **bug report** issue template when opening an issue, and include:

- Z+ version
- Operating system and architecture
- Downloaded filename
- Error message or antivirus detection name
- Steps to reproduce the problem

Please avoid posting passwords, private tokens, or other sensitive information.

## Maintainer Tools

Checksum files for a release are generated in one of two ways:

- **Locally:** run `tools/New-Checksums.ps1 -Path <directory with the release assets> -ReleaseTag <tag>`. It writes one `<name>.sha256` sidecar per artifact, `SHA256SUMS.txt`, and `release-manifest.json`, ready to upload alongside the installer.
- **On GitHub:** run the **Release checksums** workflow (**Actions → Release checksums → Run workflow**) with a tag such as `v1.3.5`. The workflow recomputes checksums from the published release assets and uploads them to the release, overwriting any existing checksum files.

## License

Licensing terms are defined by the Z+ project and the license files included with each applicable distribution.

---

**Z+ is built by Miro.**
