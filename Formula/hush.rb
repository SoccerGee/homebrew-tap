# Formula template. publish.sh fills in the version and checksums; commit the
# result to SoccerGee/homebrew-tap as Formula/hush.rb.
#
# The tap repo is public, but it only ever holds this file — hush's source
# stays private.
class Hush < Formula
  desc "Encrypted IRC-style terminal chat with peer-to-peer file transfer"
  homepage "https://dl.granttuttle.com"
  version "0.1.1"
  # Proprietary: Homebrew has no SPDX identifier for "all rights reserved".
  license :cannot_represent

  # What lets a self-hosted room reach the internet. Installing it here is the
  # difference between "send your friend a code" and "send your friend a code
  # and talk them through installing a tunnel daemon".
  depends_on "cloudflared"

  on_macos do
    url "https://dl.granttuttle.com/download/hush-0.1.1-macos-universal.tar.gz"
    sha256 "c662104d8e27eab0f954002c73384fabdce4faf1be54c452f69bd788a1e7b59f"
  end

  on_linux do
    on_intel do
      url "https://dl.granttuttle.com/download/hush-0.1.1-linux-x86_64.tar.gz"
      sha256 "d45f2265dbaaf2862d1815a5d2c2e2609066277717fa1cfd35bd115af92315d3"
    end
    on_arm do
      url "https://dl.granttuttle.com/download/hush-0.1.1-linux-aarch64.tar.gz"
      sha256 "9ed6953227c581367dfdd5d71665d6d5b78a941f262612226dc56fc0115cec99"
    end
  end

  def install
    bin.install "hush"
  end

  test do
    assert_match "hush", shell_output("#{bin}/hush --version")
  end
end
