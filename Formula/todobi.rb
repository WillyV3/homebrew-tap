class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/v1.3.5.tar.gz"
  sha256 "2210e7b0db7653ad1e73094f20c5d9eb750e4bbff7a46ec84f1f6e5c76ec0334"
  license "MIT"
  version "1.3.5"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.3.5", shell_output("#{bin}/todobi --version")
  end
end
