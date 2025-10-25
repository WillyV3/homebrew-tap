class Gittui < Formula
  desc "GitHub profile viewer TUI - Terminal dashboard for GitHub activity"
  homepage "https://github.com/willyv3/gittui"
  url "https://github.com/willyv3/gittui/archive/v0.1.0.tar.gz"
  sha256 "5a995e17efaa3e61f6b6f5f8e17e0fd598048b8507ea90d94e5aaff6397ecfa3"
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
