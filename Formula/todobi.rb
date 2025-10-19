class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/v1.3.8.tar.gz"
  sha256 "a1138cca20d615b2af2ecb318b9e95cae397d78d34f788d0fa9dd8f375a7562a"
  license "MIT"
  version "1.3.8"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.3.8", shell_output("#{bin}/todobi --version")
  end
end
