class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/v1.3.6.tar.gz"
  sha256 "89b468ffd26c866f01bd202520acdf73833d0471ae85874cdd714cc2d303200b"
  license "MIT"
  version "1.3.6"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.3.6", shell_output("#{bin}/todobi --version")
  end
end
