# blue95 &nbsp; [![bluebuild build badge](https://github.com/ledif/blue95/actions/workflows/build.yml/badge.svg)](https://github.com/ledif/blue95/actions/workflows/build.yml)

> A desktop for your childhood home's computer room.

Blue95 is a modern and lightweight desktop experience that reminds us of a bygone era of computing.
Based on Fedora Atomic Xfce with the [Chicago95](https://github.com/grassmunk/Chicago95) theme.

## Installation

The only way to install currently is to rebase from an existing atomic Fedora installation to the latest build.
ISOs will be available at some point.

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/ledif/blue95:latest
  ```
- Reboot and then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/ledif/blue95:latest
  ```

It is recommended to create a new user after rebasing.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/ledif/blue95
```

## Project Goals

- Match upstream Fedora Xfce in terms of core system components (e.g., X11 vs Wayland, pulseaudio vs wireplumber, etc).
- Pull in tweaks from [Universal Blue](https://github.com/ublue-os) (e.g. codecs, drivers) to provide a more usable out-of-the box experience.
- Provide an aesthetic that is reminiscent of a bygone era of computing.

**Non goals**:
- Faithful reproduction of design elements from decades old operating systems. Whenever usability and exact replication are at odds, usability and accessibility will generally be preferred.

## Shoutouts
- [@grassmunk](https://github.com/grassmunk)/[@dominichayesferen](https://github.com/dominichayesferen) for [Chicago95](https://github.com/grassmunk/Chicago95) and [Chicagofier](https://github.com/dominichayesferen/Chicagofier) respectively
- [BlueBuild](https://github.com/blue-build), [Universal Blue](https://github.com/ublue-os) and [Fedora](https://fedoraproject.org)
- The [Xfce](https://www.xfce.org/) team
 
