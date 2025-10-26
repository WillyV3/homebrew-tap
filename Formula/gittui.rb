class Gittui < Formula
  desc "GitHub profile viewer TUI - Terminal dashboard for GitHub activity"
  homepage "https://github.com/willyv3/gittui"
  url "https://github.com/willyv3/gittui/archive/v1.1.0.tar.gz"
  sha256 "1faf4858a0b874ffd05ff7cc95d5c1f95fa5f2938446e42cc83cdaed1dbb8b58"
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
