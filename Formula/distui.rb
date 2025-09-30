class Distui < Formula
  desc "distui"
  homepage "https://github.com/willyv3/distui"
  version "v0.0.1"
  url "https://github.com/willyv3/distui/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "0a88424eb924c0bcb768bcb00c84bbe67b0f5a00ab3528f3e19c5c830f5b8c14"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"distui"
  end

  test do
    system "#{bin}/distui", "--version"
  end
end
