class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/v1.3.3.tar.gz"
  sha256 "80c9b7b96128922bf7c272f0c9223ce5408efecc4499f2776f072381f44a15e1"
  license "MIT"
  version "1.3.3"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.3.3", shell_output("#{bin}/todobi --version")
  end
end
