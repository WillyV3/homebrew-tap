class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/v1.3.1.tar.gz"
  sha256 "4ea45522bc88a2db99af5ddd18d49c9e5335780549ad0a1b1a4406de1cbb2105"
  license "MIT"
  version "1.3.1"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.3.1", shell_output("#{bin}/todobi --version")
  end
end
