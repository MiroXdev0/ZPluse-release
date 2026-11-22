# Security Policy

## Supported Versions

Only the latest stable release receives security fixes and patches. Older releases remain downloadable for reference, but they are not maintained.

| Version | Supported |
| --- | --- |
| 1.3.5 (latest stable) | Yes |
| Older releases | No — please upgrade |

## Reporting a Vulnerability

Please do **not** report security vulnerabilities through public GitHub issues.

Preferred channel: GitHub **private vulnerability reporting**. On this repository, go to **Security → Advisories → Report a vulnerability**. That keeps the report and any discussion private until a fix is ready.

If private vulnerability reporting is not available for this repository, open a public issue that describes the problem **without exploitation details** and state clearly that it is a security concern.

When reporting, please include:

- The Z+ version affected (for example, `1.3.5`).
- Operating system and architecture.
- The exact downloaded filename involved, if relevant.
- Steps to reproduce or trigger the problem.
- Any impact you observed or believe is possible.

Vulnerability reports are reviewed and coordinated privately before any public disclosure.

## Reporting Antivirus Detections

The Windows installer and binaries may be distributed without an Authenticode signature when a trusted code-signing certificate is unavailable. Some security products may therefore flag unfamiliar or unsigned executables.

An antivirus detection is not automatically proof of malware, but it should not be ignored. If a Z+ download triggers a detection, please open a public **bug report** issue with:

- The antivirus product and the **exact** detection name.
- The downloaded filename and its published SHA-256 checksum.
- The Z+ version and the link to the release page.
- A screenshot or log excerpt, if available.

Reports are reviewed, and any clearance from antivirus vendors is documented here or in the release notes. No antivirus vendor clearance is claimed unless explicitly documented.

Do not disable antivirus protection simply to install Z+.

## Verifying Downloads

Current and future releases include SHA-256 checksum files (`<name>.sha256` sidecars, `SHA256SUMS.txt`, and `release-manifest.json`). See the **Verifying Downloads** section of the README for how to check a download on Windows, and download Z+ only from this repository or another explicitly linked official Z+ distribution channel.
