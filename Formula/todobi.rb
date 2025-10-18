class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "543034d55359c85c4396d40b18d17e01052a72a54c9c127ab3ac338daad17562"
  license "MIT"
  version "1.1.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.1.0", shell_output("#{bin}/todobi version")
  end
end
