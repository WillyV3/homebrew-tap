class Vinw < Formula
  desc "Interactive file tree viewer with real-time git tracking and syntax highlighting"
  homepage "https://github.com/willyv3/vinw"
  url "https://github.com/willyv3/vinw/archive/vbaseline-before-optimization.2.0.tar.gz"
  sha256 "e27d230adb9ebcd3da807c25537cd78de0252c98cba504274c34995abb9c4b88"
  license "MIT"

  depends_on "go" => :build
  depends_on "skate"

  def install
    # Build main vinw binary
    system "go", "build", "-o", "#{bin}/vinw"

    # Build viewer binary
    cd "viewer" do
      system "go", "build", "-o", "#{bin}/vinw-viewer"
    end
  end

  def caveats
    <<~EOS
      vinw has been installed!

      To use vinw:
        1. Start vinw in one terminal:     vinw
        2. Start viewer in another:        vinw-viewer <session-id>

      Requirements:
        - Git for repository tracking (optional)

      Controls (Vim-style):
        vinw:
          j/k or ↑/↓  - Navigate files
          h/l or ←/→  - Collapse/expand directories
          Enter/Space - Select file for viewing
          u           - Toggle hidden files
          i           - Toggle gitignore filter
          n           - Toggle full nesting
          r           - Refresh git status (fast)
          R           - Full refresh (slow)
          a           - Create new file
          A           - Create new directory
          d           - Delete file/directory
          c           - Copy path to clipboard
          t/T         - Change theme
          v           - Show viewer command
          ?           - Help
          q           - Quit

        vinw-viewer:
          e           - Edit file (auto-detects editor)
          ↑/↓         - Scroll content
          m           - Toggle mouse mode
          r           - Manual refresh
          q           - Quit

      Performance:
        - Auto-refresh runs every 60s (use 'r' for manual refresh)
        - Untracked files show as "(new)" for speed
        - Tree navigation is instant even in large repos
    EOS
  end

  test do
    # Test that binaries exist and are executable
    assert_predicate bin/"vinw", :exist?
    assert_predicate bin/"vinw", :executable?
    assert_predicate bin/"vinw-viewer", :exist?
    assert_predicate bin/"vinw-viewer", :executable?
  end
end