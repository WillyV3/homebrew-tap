class SlaygentComms < Formula
  desc "Inter-agent communication system for AI coding assistants in tmux panes"
  homepage "https://github.com/WillyV3/slaygent-comms"
  url "https://github.com/WillyV3/slaygent-comms/archive/v1.0.2.tar.gz"
  sha256 "d68da1f153cde6802a44aec1526488c9f4e80560d00e23bb84a2db0ed0d756b9"
  license "MIT"

  depends_on "go" => :build
  depends_on "tmux"
  depends_on "fd"

  def install
    # Build TUI manager
    cd "app/tui" do
      system "go", "build", "-o", "bin/slaygent-manager"
      bin.install "bin/slaygent-manager"
    end

    # Build messenger
    cd "app/messenger" do
      system "go", "build", "-o", "bin/msg"
      bin.install "bin/msg"
    end

    # Create shell aliases in completion scripts
    (bash_completion/"slaygent").write <<~EOS
      alias slay='#{bin}/slaygent-manager'
      alias msg='#{bin}/msg'
    EOS

    (zsh_completion/"_slaygent").write <<~EOS
      alias slay='#{bin}/slaygent-manager'
      alias msg='#{bin}/msg'
    EOS

    # Install sync scripts
    libexec.install "app/scripts/sync-claude.sh"
    libexec.install "app/scripts/custom-sync-claude.sh"

    # Install documentation
    doc.install "CLAUDE.md"
    doc.install "app/tui/CLAUDE.md" => "TUI_GUIDE.md"
    doc.install "app/messenger/CLAUDE.md" => "MESSENGER_GUIDE.md"
  end

  def post_install
    # Create slaygent directory
    (var/"slaygent").mkpath

    # Initialize registry if it doesn't exist
    registry_file = "#{Dir.home}/.slaygent/registry.json"
    unless File.exist?(registry_file)
      system "mkdir", "-p", "#{Dir.home}/.slaygent"
      File.write(registry_file, "[]")
    end

    puts <<~EOS

      🚀 Slaygent Communication Suite installed successfully!

      Commands:
        slaygent-manager  - Launch TUI manager
        msg <agent> "..."  - Send message to agent

      Quick Start:
        1. Start tmux: tmux new
        2. Launch TUI: slaygent-manager
        3. Register agents with 'a' key
        4. Send messages: msg agent-name "Hello!"

      For shell aliases, add to your shell config:
        alias slay='slaygent-manager'
        alias msg='msg'

      Documentation: brew --prefix slaygent-comms/share/doc/slaygent-comms/
    EOS
  end

  test do
    # Test that binaries are installed and executable
    assert_match "Usage:", shell_output("#{bin}/msg 2>&1", 1)

    # Test TUI manager help (should exit with error without tmux)
    system "#{bin}/slaygent-manager", "--help"
  end
end