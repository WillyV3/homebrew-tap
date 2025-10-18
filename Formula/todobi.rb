class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/v1.3.2.tar.gz"
  sha256 "e55ed2ad17dbcb0e6afddeb37e66dd4e0aab415c614dd0f7f72498346042cf8e"
  license "MIT"
  version "1.3.2"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.3.2", shell_output("#{bin}/todobi --version")
  end
end
