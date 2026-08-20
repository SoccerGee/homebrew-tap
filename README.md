# homebrew-tap

    brew install --cask soccergee/tap/windex
    xattr -dr com.apple.quarantine /Applications/Windex.app

Windex is not notarized and Homebrew quarantines every cask, so the second
line is what lets macOS open it. See https://github.com/SoccerGee/windex
