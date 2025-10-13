class Cattui < Formula
  desc "🐱 Terminal cat Tamagotchi game - Care for your virtual cat with multiple breeds and difficulty modes"
  homepage "https://github.com/williavs/cattui"
  url "https://github.com/williavs/cattui/archive/v0.1.0.tar.gz"
  sha256 "af4e6b87488f8237531de49f3dc2e3338780028b6b706daa4126ecb87020c4be"
  license "MIT"

  depends_on "go" => :build

  def install
    # Build cattui binary
    system "go", "build", "-o", "#{bin}/cattui", "main.go", "modes.go"
  end

  def caveats
    <<~EOS
      🐱 CatTUI has been installed!

      To start playing:
        cattui

      Features:
        - 5 unique cat breeds (Ragdoll, Siberian, Scottish Fold, Norwegian Forest, Maine Coon)
        - 3 difficulty modes (Relaxed, Normal, Chaotic)
        - 4 care actions (Feed, Clean, Play, Snuggle)
        - Mischief system with 3-strike lockout
        - Beautiful ASCII art with 5 moods per breed

      Controls:
        ↑/↓ or j/k  - Navigate menus
        Enter       - Confirm selection
        1-4         - Quick actions (Feed/Clean/Play/Snuggle)
        q           - Quit

      Keep your cat happy! 🐾

              :::   :::   :::::::::: ::::::::  :::       ::: :::
             :+:+: :+:+:  :+:       :+:    :+: :+:       :+: :+:
           +:+ +:+:+ +:+ +:+       +:+    +:+ +:+       +:+ +:+
          +#+  +:+  +#+ +#++:++#  +#+    +:+ +#+  +:+  +#+ +#+
         +#+       +#+ +#+       +#+    +#+ +#+ +#+#+ +#+ +#+
        #+#       #+# #+#       #+#    #+#  #+#+# #+#+#
       ###       ### ########## ########    ###   ###   ###

      Blog: breakshit.blog
      Website: willyv3.com
      @humanfrontierlabs
    EOS
  end

  test do
    # Test that binary exists and is executable
    assert_predicate bin/"cattui", :exist?
    assert_predicate bin/"cattui", :executable?
  end
end
