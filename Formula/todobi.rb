class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/v1.3.0.tar.gz"
  sha256 "9104577792a1fe4d6811a1c193ae12271cfa4670978962642265ddd8fddbddbf"
  license "MIT"
  version "1.3.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.3.0", shell_output("#{bin}/todobi --version")
  end
end
