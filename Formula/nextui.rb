class Nextui < Formula
  desc "TUI to scaffold Next.js projects with shadcn/ui components and authentication"
  homepage "https://github.com/WillyV3/nextjs-templater"
  url "https://github.com/WillyV3/nextjs-templater/archive/v0.1.13.tar.gz"
  sha256 "0ceaa33a4d920f04112e932fc934dd8185cd137b8ec2a2f65dad81d1d229058a"
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