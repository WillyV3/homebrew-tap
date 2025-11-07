class Gittui < Formula
  desc "GitHub profile viewer TUI - Terminal dashboard for GitHub activity"
  homepage "https://github.com/willyv3/gittui"
  url "https://github.com/WillyV3/gittui/archive/v1.3.4.tar.gz"
  sha256 "f161cdd6a61c0a6fd7f25faee14dd00971642373fe747b844791b3be5e11b5f1"
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

      Configure settings:
        gittui-config

      Press 't' to cycle through 364 themes!
    EOS
  end

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", "-ldflags", "-s -w", "-o", bin/"gittui", "./cmd/gittui"
    bin.install "scripts/configure.sh" => "gittui-config"
  end

  test do
    # Test that binary exists and shows help
    assert_match "Usage:", shell_output("#{bin}/gittui --help 2>&1", 1)
  end
end
