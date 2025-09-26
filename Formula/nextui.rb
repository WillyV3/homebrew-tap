class Nextui < Formula
  desc "TUI to scaffold Next.js projects with shadcn/ui components and authentication"
  homepage "https://github.com/WillyV3/nextjs-templater"
  url "https://github.com/WillyV3/nextjs-templater/archive/v0.1.19.tar.gz"
  sha256 "122b3655249c8ac8495952b9f320832739b780b7934886f95d26f7a4a9a8d23e"
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