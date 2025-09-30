class Distui < Formula
  desc "TUI for managing Go application releases"
  homepage "https://github.com/willyv3/distui"
  version "0.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/WillyV3/distui/releases/download/v0.0.10/distui_0.0.10_darwin_arm64.tar.gz"
      sha256 "85b6e4cc797f07e2938070d074e89754021217f8f54a06288a2bf6079a88b8c5"
    else
      url "https://github.com/WillyV3/distui/releases/download/v0.0.10/distui_0.0.10_darwin_amd64.tar.gz"
      sha256 "7a440e37854ad5dd25e5d4460b62320926ae8b6011c2420fffa28b4ee23ed2d4"
    end
  end


  def install
    bin.install "distui"
  end

  test do
    system "#{bin}/distui", "--version"
  end
end