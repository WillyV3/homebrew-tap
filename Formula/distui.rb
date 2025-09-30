class Distui < Formula
  desc "distui"
  homepage "https://github.com/willyv3/distui"
  version "v0.0.10"
  url "https://github.com/willyv3/distui/archive/refs/tags/v0.0.10.tar.gz"
  sha256 "677404536d87161638e0a17259df8d06da9c05fdeb6ecdbd9db8a981623148fc"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"distui"
  end

  test do
    system "#{bin}/distui", "--version"
  end
end
