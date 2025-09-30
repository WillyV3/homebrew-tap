class Distui < Formula
  desc "distui"
  homepage "https://github.com/willyv3/distui"
  version "v0.0.1"
  url "https://github.com/willyv3/distui/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "7f2f6572011891f1551ed4fbf340d4d146ab10fb47faeccad31801b3db7242bf"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"distui"
  end

  test do
    system "#{bin}/distui", "--version"
  end
end
