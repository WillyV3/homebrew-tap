class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/v1.4.1.tar.gz"
  sha256 "7ee5239970bc492ba0cd8bb775d32a0ff867f2b8e7896ee07b9f56fce4740266"
  license "MIT"
  version "1.4.1"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.4.1", shell_output("#{bin}/todobi --version")
  end
end
