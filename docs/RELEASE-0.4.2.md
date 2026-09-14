Macus 0.4.2 makes **MBR + FAT32 + UEFI** the default for Windows installer USBs. This avoids the separate unused EFI partition that macOS creates when formatting the USB as GPT.

## Windows boot issue

A user reported that a Windows installation would only boot while the installer USB remained connected. They confirmed that recreating the installer in **Macus 0.4.1 with MBR + FAT32 + UEFI** resolved the problem. This release makes that working configuration the default. The reported physical test used 0.4.1 with those settings, not the 0.4.2 binary.

The USB partition scheme is separate from the internal Windows disk's partition scheme. Boot the installer using its **UEFI** entry; the internal Windows disk can still be GPT. GPT remains available as an explicit USB option.

## Downloads and installation

- **Macus-0.4.2-arm64.dmg** — recommended installer for Apple Silicon Macs running macOS 26 or later. Quit Macus, open the DMG, drag Macus into Applications and replace the old version.
- **Macus-0.4.2-arm64.zip** — the same signed application as a ZIP.
- **SHA256SUMS.txt** — SHA-256 checksums for both downloads.

Select the Windows ISO to apply the new recommended settings. Existing USBs are not changed by updating Macus. Creating a new installer erases the selected USB. If an installed Windows system currently relies on a USB to boot, preserve that USB until you repair Windows or are ready to reinstall. This Mac app update does not repair an existing Windows installation.

## Validation and included fixes

- 35 Swift tests passed, including writer execution with the recommended MBR defaults and retained explicit GPT coverage.
- App and DMG are Developer ID signed, Apple-notarized, and carry validated stapled tickets.
- Includes the 0.4.1 fix for installed-app resource lookup, covering Windows preparation, the image catalog, and toolkit export.
- The user-confirmed installation result above does not establish compatibility with every PC.

## PC diagnostics

Quick Scan 1.1 is unchanged. Existing diagnostic USBs do not need to be recreated for this update. The boot image remains separate:

- [Quick Scan 1.1 USB image ZIP](https://github.com/abrichardson/Macus/releases/download/v0.4.0/Macus-QuickScan-USB.img.zip)
- [Quick Scan download checksums](https://github.com/abrichardson/Macus/releases/download/v0.4.0/SHA256SUMS.txt)

No Windows installer image is included.
