class Gittui < Formula
  desc "GitHub profile viewer TUI - Terminal dashboard for GitHub activity"
  homepage "https://github.com/willyv3/gittui"
  url "https://github.com/WillyV3/gittui/archive/v1.3.0.tar.gz"
  sha256 "2ee5f03b982032c5a70a2cd263178fd763f449d4acde5926efebfa91dd89e442"
  license "MIT"

  depends_on "go" => :build

  def caveats
    <<~EOS
      ░█▀▀░▀█▀░▀█▀░▀█▀░█░█░▀█▀
      ░█░█░░█░░░█░░░█░░█░█░░█░
      ░▀▀▀░▀▀▀░░▀░░░▀░░▀▀▀░▀▀▀

      Authenticate with GitHub CLI first:
        gh auth login

      View your profile:
        gittui

      View another user:
        gittui username

      Press 't' to cycle through 364 themes!
    EOS
  end

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"gittui"
  end

  test do
    # Test that binary exists and shows help
    assert_match "Usage:", shell_output("#{bin}/gittui --help 2>&1", 1)
  end
end
