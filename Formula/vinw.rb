class Vinw < Formula
  desc "Interactive file tree viewer with real-time git tracking and syntax highlighting"
  homepage "https://github.com/willyv3/vinw"
  url "https://github.com/willyv3/vinw/archive/v1.3.1.tar.gz"
  sha256 "29b49c0f267f989c687cd6ed261b55438fcc01ee871803ed9d2f665cdaba7d07"
  license "MIT"

  depends_on "go" => :build

  def install
    # Build main vinw binary
    system "go", "build", "-o", "#{bin}/vinw"

    # Build viewer binary
    cd "viewer" do
      system "go", "build", "-o", "#{bin}/vinw-viewer"
    end
  end

  def post_install
    # Install Skate if not already installed
    unless which("skate")
      ohai "Installing Skate (required for IPC between vinw and vinw-viewer)..."
      system "go", "install", "github.com/charmbracelet/skate@latest"
    end
  end

  def caveats
    <<~EOS
      vinw has been installed!

      To use vinw:
        1. Start vinw in one terminal:     vinw
        2. Start viewer in another:        vinw-viewer

      Requirements:
        - Skate is required for IPC (will be installed if missing)
        - Git for repository tracking

      Controls:
        vinw:
          j/k or ↑/↓  - Navigate files
          Enter       - Select file for viewing
          i           - Toggle gitignore filter
          q           - Quit

        vinw-viewer:
          ↑/↓         - Scroll content
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