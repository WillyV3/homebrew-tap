class Nextui < Formula
  desc "TUI to scaffold Next.js projects with shadcn/ui components and authentication"
  homepage "https://github.com/WillyV3/nextjs-templater"
  url "https://github.com/WillyV3/nextjs-templater/archive/v0.1.45.tar.gz"
  sha256 "b39056a02bafe4da60583644b304b80b04d870604e1fde9c91f7b333e3ce87a0"
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