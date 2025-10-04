class Vinw < Formula
  desc "Interactive file tree viewer with real-time git tracking and syntax highlighting"
  homepage "https://github.com/williavs/treetui"
  url "https://github.com/williavs/treetui/archive/v1.0.0.tar.gz"
  sha256 "5a87ff8b654abb7510b4f6bf4896c8b9eb389d0f93ef781abbcf90723d26c437"
  license "MIT"

  depends_on "go" => :build

  def install
    cd "app" do
      system "go", "build", "-o", "#{bin}/vinw"

      cd "viewer" do
        system "go", "build", "-o", "#{bin}/vinw-viewer"
      end
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
    system "#{bin}/vinw", "--version"
    system "#{bin}/vinw-viewer", "--version"
  end
end