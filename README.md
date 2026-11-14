# Z+ Releases

**Official releases and downloadable builds of the Z+ programming language.**

Z+ is a programming language designed to make programming approachable while providing access to more advanced language features, libraries, and native execution.

This repository contains official compiled releases of Z+. It is separate from the main development source code.

## Downloads

**Latest stable release:** [View Releases](https://github.com/MiroXdev0/ZPluse-release/releases/latest)

Download the installer or other available assets from the corresponding GitHub Release.

Each release includes its own version tag, release notes, and available download files.

## Versioning

Z+ uses semantic versioning:

`MAJOR.MINOR.PATCH`

For example:

- `1.1.5` - Current release
- `1.1.4` - Previous release
- `1.1.2` - Older release

Git tags use the `v` prefix:

- `v1.1.5`
- `v1.1.4`
- `v1.1.2`

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

If the release includes ZBuild, you can also check it with:

```powershell
zbuild --version
```

Check the individual release notes for platform-specific instructions and included components.

## Verifying Downloads

Releases may include SHA-256 checksum files and a release manifest.

To calculate a file's SHA-256 hash on Windows:

```powershell
Get-FileHash .\ZPlus-1.1.5-Setup.exe -Algorithm SHA256
```

Compare the resulting hash with the value published in the corresponding release's checksum file.

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

## Project Links

- **Website:** https://zpluse.vercel.app/
- **Releases:** https://github.com/MiroXdev0/ZPluse-release/releases
- **Source and development:** https://github.com/MiroXdev0

## Reporting Issues

For release-related problems, open an issue and include:

- Z+ version
- Operating system and architecture
- Downloaded filename
- Error message or antivirus detection name
- Steps to reproduce the problem

Please avoid posting passwords, private tokens, or other sensitive information.

## License

Licensing terms are defined by the Z+ project and the license files included with each applicable distribution.

---

**Z+ is built by Miro.**
