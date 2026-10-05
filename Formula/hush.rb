# Formula template. publish.sh fills in the version and checksums; commit the
# result to SoccerGee/homebrew-tap as Formula/hush.rb.
#
# The tap repo is public, but it only ever holds this file — hush's source
# stays private.
class Hush < Formula
  desc "Encrypted IRC-style terminal chat with peer-to-peer file transfer"
  homepage "https://hush.granttuttle.com"
  version "0.1.2"
  # Proprietary: Homebrew has no SPDX identifier for "all rights reserved".
  license :cannot_represent

  # What lets a self-hosted room reach the internet. Installing it here is the
  # difference between "send your friend a code" and "send your friend a code
  # and talk them through installing a tunnel daemon".
  depends_on "cloudflared"

  on_macos do
    url "https://hush.granttuttle.com/download/hush-0.1.2-macos-universal.tar.gz"
    sha256 "885063edb8065a4579108f4876e2d0cd4ca49c58210d5f55e9f2b1111998ea22"
  end

  on_linux do
    on_intel do
      url "https://hush.granttuttle.com/download/hush-0.1.2-linux-x86_64.tar.gz"
      sha256 "f4b5b6e061dcb137355814c3cd270b83fc7130f6636c4262e77e3d04aca13fde"
    end
    on_arm do
      url "https://hush.granttuttle.com/download/hush-0.1.2-linux-aarch64.tar.gz"
      sha256 "c2489322370d0c5043193ebff7df4df5f99d51b7eff79fa2ad7e873df7d41994"
    end
  end

  def install
    bin.install "hush"
  end

  test do
    assert_match "hush", shell_output("#{bin}/hush --version")
  end
end
