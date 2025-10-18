class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/v1.2.0.tar.gz"
  sha256 "7a6983f6a769e52b3214e3de806e60e5af0277edb66102ecf2be8d50006eae38"
  license "MIT"
  version "1.2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.2.0")
  end
end
