class Nextui < Formula
  desc "TUI to scaffold Next.js projects with shadcn/ui components and authentication"
  homepage "https://github.com/WillyV3/nextjs-templater"
  url "https://github.com/WillyV3/nextjs-templater/archive/v0.0.1.tar.gz"
  sha256 "8636b99adf23b940cb17e307998c9ce92b6bb57e4a9904e93d4e83740c746936"
  license "MIT"

  depends_on "go" => :build
  depends_on "node"

  def install
    system "go", "build", "-o", "nextui"
    bin.install "nextui"

    # Install shell script
    bin.install "create-nextjs-shadcn.sh"

    # Install ASCII art file
    share.install "asciiArt.txt"
  end

  test do
    system "#{bin}/nextui", "--version"
  end
end