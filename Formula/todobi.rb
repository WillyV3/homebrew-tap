class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/v1.4.0.tar.gz"
  sha256 "094a177c3b067582eb7521e99eb19b7fb2e8f3da0cbcc147f764534f30e95bbf"
  license "MIT"
  version "1.4.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.4.0", shell_output("#{bin}/todobi --version")
  end
end
