class Agentdl < Formula
  desc "TUI for finding and downloading Claude agent configurations from GitHub"
  homepage "https://github.com/williavs/AGENTDL"
  url "https://github.com/williavs/agent-search/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "3f7331ea27b42697f0c42cfd62691880004042bb61343dff25eabcbe1b9f57eb"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"agentdl", "."
  end

  test do
    assert_match "AGENT GETTER", shell_output("#{bin}/agentdl --version 2>&1", 1)
  end
end