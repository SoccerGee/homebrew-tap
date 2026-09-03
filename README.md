# homebrew-tap

    brew install --cask soccergee/tap/windex
    xattr -dr com.apple.quarantine /Applications/Windex.app

Windex is not notarized and Homebrew quarantines every cask, so the second
line is what lets macOS open it. See https://github.com/SoccerGee/windex

## hush

    brew install soccergee/tap/hush

Encrypted IRC-style terminal chat with peer-to-peer file transfer. Homebrew
verifies the tarball against the sha256 pinned in the formula, so no
quarantine step is needed. Linux users have an installer instead; see
https://dl.granttuttle.com.

Release manifests are signed with this OpenSSH key. The Linux installer
carries the same key on its `RELEASE_PUBKEY=` line; compare the two if you
want to be sure the copy served from the download site is genuine:

    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMfs9xzv5rYRiWvFrHvhO+WewLG7VcNQUYtSYPgvoE4f hush-release
