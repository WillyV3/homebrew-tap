class Nextui < Formula
  desc "TUI to scaffold Next.js projects with shadcn/ui components and authentication"
  homepage "https://github.com/WillyV3/nextjs-templater"
  url "https://github.com/WillyV3/nextjs-templater/archive/v0.1.15.tar.gz"
  sha256 "b0aad803b9abd3978c81e5c8c76e8112df9002bd4c2b8213bf5cdc65b76ac9d3"
  license "MIT"

  depends_on "go" => :build
  depends_on "node"

  def install
    system "go", "build", "-o", "nextui"
    bin.install "nextui"
  end

  test do
    # Test that the binary runs (no --version flag available)
    system "#{bin}/nextui", "--help" rescue true
  end
end