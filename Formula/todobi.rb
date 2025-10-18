class Todobi < Formula
  desc "Beautiful terminal task manager built with Bubble Tea"
  homepage "https://github.com/WillyV3/todobi"
  url "https://github.com/WillyV3/todobi/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1e543a6b802e540a7731efff776359d21d168a7080929e974cef5787d9f2c009"
  license "MIT"
  version "1.0.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "todobi v1.0.0", shell_output("#{bin}/todobi version")
  end
end
