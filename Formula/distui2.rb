class Distui2 < Formula
  desc "distui2 CLI tool"
  homepage "https://github.com/WillyV3/distui2"
  url "https://github.com/WillyV3/distui2/releases/download/v0.1.0/distui2-v0.1.0.tar.gz"
  sha256 "3c42b8532911b4a8cc21bc992d8209cbf729901ecbacb422abb899dbd4a9f0fb"
  license "MIT"
  version "v0.1.0"

  def install
    bin.install "distui2"
  end

  test do
    system "#{bin}/distui2", "--version"
  end
end
