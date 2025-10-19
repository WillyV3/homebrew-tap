class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/v1.3.7.tar.gz"
  sha256 "6449b6c43a9cfea09a0e44bb997e31ca893c048f886e88a98324dac23a4c79f4"
  license "MIT"
  version "1.3.7"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.3.7", shell_output("#{bin}/todobi --version")
  end
end
