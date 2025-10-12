class Vinw < Formula
  desc "Interactive file tree viewer with real-time git tracking and syntax highlighting"
  homepage "https://github.com/willyv3/vinw"
  url "https://github.com/willyv3/vinw/archive/v1.5.4.tar.gz"
  sha256 "bda7ced5f765561771a0215774c26a416dac7b9da084eb87433373f193740a56"
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
        2. Start viewer in another:        vinw-viewer

      Requirements:
        - Git for repository tracking (optional)

      Controls:
        vinw:
          j/k or ↑/↓  - Navigate files
          Enter       - Select file for viewing
          i           - Toggle gitignore filter
          q           - Quit

        vinw-viewer:
          e           - Edit file (auto-detects editor)
          ↑/↓         - Scroll content
          m           - Toggle mouse mode
          r           - Manual refresh
          q           - Quit
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