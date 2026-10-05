# Formula template. publish.sh fills in the version and checksum and commits
# the result to SoccerGee/homebrew-tap as Formula/ma.rb.
#
# The tap repo is public, but it only ever holds this file — ma's source stays
# private.
class Ma < Formula
  desc "Quiet, distraction-free terminal editor for writing a book"
  homepage "https://granttuttle.com/turbot-ai/ma"
  url "https://ma.granttuttle.com/download/ma-0.1.0-macos-universal.tar.gz"
  sha256 "09530cab6d8ce3b0998a5177736cd5e10f8e66b7900bd6689f0119c4a58d2ee4"
  # Proprietary: Homebrew has no SPDX identifier for "all rights reserved".
  license :cannot_represent

  # The clipboard, the light/dark switch and the key clicks all speak to macOS.
  depends_on :macos

  def install
    bin.install "ma"
    doc.install "LICENSE", "THIRD-PARTY-NOTICES"
  end

  def caveats
    <<~EOS
      Type `ma` to begin. It asks for a title, then puts you on the page.
      Inside: just write. esc steps back, space opens the room, ? shows the keys.
    EOS
  end

  test do
    assert_match "ma #{version}", shell_output("#{bin}/ma --version")
    # A book can be begun and bound without a terminal attached.
    (testpath/"book/ma.toml").write "title = \"Test\"\n"
    (testpath/"book/manuscript").mkpath
    (testpath/"book/manuscript/01-one.md").write "# One\n\nIt was quiet.\n"
    cd testpath/"book" do
      assert_match "bound 1 chapter", shell_output("#{bin}/ma export md")
    end
    assert_match "It was quiet.", (testpath/"book/export/test.md").read
  end
end
