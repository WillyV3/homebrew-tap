class Distui < Formula
  desc "distui"
  homepage "https://github.com/willyv3/distui"
  version "v0.0.1"
  url "https://github.com/willyv3/distui/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "8e2cf7eba2544d75f0ddd19c0acad809e20d98950021a575be1c98033c03179f"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"distui"
  end

  test do
    system "#{bin}/distui", "--version"
  end
end
