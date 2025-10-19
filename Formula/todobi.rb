class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/v1.3.9.tar.gz"
  sha256 "22a43347c46113320721bf3f571d942132836c68cea18b7fa2f904b66308a9f0"
  license "MIT"
  version "1.3.9"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.3.9", shell_output("#{bin}/todobi --version")
  end
end
