class Gittui < Formula
  desc "GitHub profile viewer TUI - Terminal dashboard for GitHub activity"
  homepage "https://github.com/willyv3/gittui"
  url "https://github.com/willyv3/gittui/archive/v1.0.1.tar.gz"
  sha256 "f47f8716ed5eaf753b3d4c3408c571dcf9bc4dc422deba50827d9fbc6c2f1196"
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
