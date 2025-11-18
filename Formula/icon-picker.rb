class IconPicker < Formula
  desc "Terminal UI for browsing and selecting Nerd Font icons"
  homepage "https://github.com/WillyV3/icon-picker"
  url "https://github.com/WillyV3/icon-picker/archive/v0.0.2.tar.gz"
  sha256 "5394763ed1428d04edaf02c8231014c23de11c6307a00f85476c2cd2e6e88a06"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
    bin.install "icons"
  end

  test do
    system "#{bin}/icon-picker", "--version"
  end
end
