class Distui < Formula
  desc "distui"
  homepage "https://github.com/willyv3/distui"
  version "v0.0.1"
  url "https://github.com/willyv3/distui/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "d69172ecb0238c8344894c424195a664bc34b0d2c434b59a7490c4ba47da2d9e"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"distui"
  end

  test do
    system "#{bin}/distui", "--version"
  end
end
