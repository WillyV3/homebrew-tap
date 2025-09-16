class Agentdl < Formula
  desc "TUI for finding and downloading Claude agent configurations from GitHub"
  homepage "https://github.com/williavs/AGENTDL"
  url "https://github.com/williavs/AGENTDL/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "a6d6b2838277a5c8ba56683b436f88a267d15b8b642345f4e25e434a58f36e48"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"agentdl", "."
  end

  test do
    assert_match "AGENT GETTER", shell_output("#{bin}/agentdl --version 2>&1", 1)
  end
end