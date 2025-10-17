class GummyAgent < Formula
  desc "Fast multi-agent orchestration using Claude Haiku with real-time TUI monitoring"
  homepage "https://github.com/WillyV3/gummy-agent"
  url "https://github.com/WillyV3/gummy-agent/archive/v0.0.8.tar.gz"
  sha256 "0a50ab0cc613af38749096a5d588328d0f4acf90b3f29c6e905affb6929baae2"
  license "MIT"

  depends_on "go" => :build

  def install
    # Build the TUI
    system "go", "build", "-o", "gummy-watch", "gummy-watch.go"

    # Install binaries
    bin.install "gummy"
    bin.install "gummy-watch"

    # Install slash commands for Claude CLI
    (prefix/"commands").install Dir["commands/*.md"]
  end

  def post_install
    # Commands are installed to #{prefix}/commands
    # Users will run the setup command to copy them
    ohai "Run 'gummy setup' to install Claude CLI commands"
  end

  def caveats
    <<~EOS

eeeee e   e eeeeeee eeeeeee e    e    eeeee eeeee eeee eeeee eeeee eeeee
8   8 8   8 8  8  8 8  8  8 8    8    8   8 8   8 8    8   8   8   8   "
8e    8e  8 8e 8  8 8e 8  8 8eeee8    8eee8 8e    8eee 8e  8   8e  8eeee
88 "8 88  8 88 8  8 88 8  8   88      88  8 88 "8 88   88  8   88     88
88ee8 88ee8 88 8  8 88 8  8   88      88  8 88ee8 88ee 88  8   88  8ee88

                                                        @builtbywilly.com

      gummy-agent installed!

      Fast multi-agent orchestration with Claude Haiku 4.5

      Usage:
        gummy plan "build auth system"    - Plan complex features
        gummy task "refactor helpers"     - Quick single tasks
        gummy execute [task-id]           - Run approved plan
        gummy-watch [task-id]             - Monitor with TUI

      Press 'c' in TUI to copy output to clipboard

      Logs:    ~/.claude/logs/gummy/
      Reports: ~/.claude/agent_comms/gummy/

      Docs: https://github.com/WillyV3/gummy-agent

      ┌────────────────────────────────────────────────────────────────┐
      │  SETUP: Run once to install Claude Code commands              │
      │    gummy setup                                                 │
      └────────────────────────────────────────────────────────────────┘
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gummy 2>&1", 1)
  end
end
