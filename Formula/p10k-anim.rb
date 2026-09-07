# Formula template. scripts/release.sh fills in the version and checksum and
# commits the result to SoccerGee/homebrew-tap as Formula/p10k-anim.rb.
class P10kAnim < Formula
  desc "Animated prompt segment for Powerlevel10k (spinner, wave, comet, Matrix rain...)"
  homepage "https://github.com/SoccerGee/p10k-anim"
  url "https://github.com/SoccerGee/p10k-anim/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d518cebe039364c27198e0b8f027a21c43fa968111ec43117b5ab3c90d9c44b8"
  license "MIT"

  # Loads after Powerlevel10k; the theme itself is the user's to install however
  # they like (Oh My Zsh, brew, git), so it is deliberately not a dependency.
  uses_from_macos "zsh"

  def install
    pkgshare.install "p10k-anim.plugin.zsh"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      Add `anim` to your prompt elements in ~/.p10k.zsh, then source the plugin
      at the END of that file (it must load after Powerlevel10k):

        typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(anim dir vcs)
        P10K_ANIM_STYLE=spinner
        source #{opt_pkgshare}/p10k-anim.plugin.zsh

      Switch styles live with `p10k-anim wave`; list them with `p10k-anim list`.
      tmux users: `set -g focus-events on` so only the focused pane animates.
    EOS
  end

  test do
    system "zsh", "-n", pkgshare/"p10k-anim.plugin.zsh"
    assert_match "p10k-anim", (pkgshare/"p10k-anim.plugin.zsh").read
  end
end
