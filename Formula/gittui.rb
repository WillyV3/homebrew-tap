class Gittui < Formula
  desc "GitHub profile viewer TUI - Terminal dashboard for GitHub activity"
  homepage "https://github.com/willyv3/gittui"
  url "https://github.com/willyv3/gittui/archive/v0.0.1.tar.gz"
  sha256 "07dc8c1c718c6b47425a0073982262856f64089a9a7c5198f20e379234a3d713"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"gittui"
  end

  test do
    # Test that binary exists and shows help
    assert_match "Usage:", shell_output("#{bin}/gittui --help 2>&1", 1)
  end
end
