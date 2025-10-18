class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/v1.3.4.tar.gz"
  sha256 "ff973d87e6884d1832427d6775772b9f0205f4f1c74300727f67ca3178607024"
  license "MIT"
  version "1.3.4"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.3.4", shell_output("#{bin}/todobi --version")
  end
end
