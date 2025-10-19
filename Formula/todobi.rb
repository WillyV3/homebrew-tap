class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/v1.3.10.tar.gz"
  sha256 "279f2c5e167ddb7b5d10280d73666a3544827539dc6ab4ec56b7349f3f3799c7"
  license "MIT"
  version "1.3.10"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.3.10", shell_output("#{bin}/todobi --version")
  end
end
