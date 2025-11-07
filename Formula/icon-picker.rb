class IconPicker < Formula
  desc "Terminal UI for browsing and selecting Nerd Font icons"
  homepage "https://github.com/WillyV3/icon-picker"
  url "https://github.com/WillyV3/icon-picker/archive/v0.0.1.tar.gz"
  sha256 "291d615bd5ca6cbcfa150452c0382fdacd8e2de74c78dc15d30a2226c283181a"
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
