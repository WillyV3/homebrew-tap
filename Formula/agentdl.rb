class Agentdl < Formula
  desc "TUI for finding and downloading Claude agent configurations from GitHub"
  homepage "https://github.com/williavs/AGENTDL"
  url "https://github.com/williavs/agent-search/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "143c0bb4fd7e07bedde9df8024331b5ffbb000cd2297a1ac4daf27c1541f3ba3"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"agentdl", "*.go"
  end

  test do
    assert_match "AGENT GETTER", shell_output("#{bin}/agentdl --version 2>&1", 1)
  end
end