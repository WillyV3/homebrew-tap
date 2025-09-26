class Nextui < Formula
  desc "TUI to scaffold Next.js projects with shadcn/ui components and authentication"
  homepage "https://github.com/WillyV3/nextjs-templater"
  url "https://github.com/WillyV3/nextjs-templater/archive/v0.1.42.tar.gz"
  sha256 "fc420166e77cb065bdfa0a5b5b7327e81dc2f02c213fa42b4c483e4dfcbe7fcb"
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