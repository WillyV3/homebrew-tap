class Agentdl < Formula
  desc "TUI for finding and downloading Claude agent configurations from GitHub"
  homepage "https://github.com/williavs/AGENTDL"
  url "https://github.com/williavs/AGENTDL/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "1e8fe9952fbe62362f8f9d8e19d8484118aefee62ec17b4afc84bd5dbadf2d86"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"agentdl", "."
  end

  test do
    assert_match "AGENT GETTER", shell_output("#{bin}/agentdl --version 2>&1", 1)
  end
end