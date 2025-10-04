class Vinw < Formula
  desc "Interactive file tree viewer with real-time git tracking and syntax highlighting"
  homepage "https://github.com/williavs/treetui"
  url "https://github.com/williavs/treetui/archive/v1.1.0.tar.gz"
  sha256 "827e80bdbda450190ea20e81aaa51e1bd9793cf029ada66bc16cc5c2d8d47b21"
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