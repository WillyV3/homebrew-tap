class Distui < Formula
  desc "distui"
  homepage "https://github.com/willyv3/distui"
  version "v0.0.1"
  url "https://github.com/willyv3/distui/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "eec27dbafdfe840c0ee525f3ccb9914734c0a1321741eed4600b8426d8ec902f"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"distui"
  end

  test do
    system "#{bin}/distui", "--version"
  end
end
