class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/v1.4.0.tar.gz"
  sha256 "7183abd514342857209331cff7cb38ad1c92fb19f5d2778bd414795560247246"
  license "MIT"
  version "1.4.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.4.0", shell_output("#{bin}/todobi --version")
  end
end
