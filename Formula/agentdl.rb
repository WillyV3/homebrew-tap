class Agentdl < Formula
  desc "TUI for finding and downloading Claude agent configurations from GitHub"
  homepage "https://github.com/williavs/AGENTDL"
  url "https://github.com/williavs/agent-search/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "2cd5ce6e4af291d84db09dc023eebe1d12f83f08449cd7c0372bb3743a05a589"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"agentdl", "."
  end

  test do
    assert_match "AGENT GETTER", shell_output("#{bin}/agentdl --version 2>&1", 1)
  end
end