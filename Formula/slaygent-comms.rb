class SlaygentComms < Formula
  desc "Inter-agent communication system for AI coding assistants in tmux panes"
  homepage "https://github.com/WillyV3/slaygent-comms"
  url "https://github.com/WillyV3/slaygent-comms/archive/v0.1.3.tar.gz"
  sha256 "ce12392335921c693921e0679385dfff4a4a18cee8d4c42407e8c8360458f57c"
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

    # Create wrapper script for 'slay' command
    (bin/"slay").write <<~EOS
      #!/bin/bash
      exec "#{bin}/slaygent-manager" "$@"
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
        slay              - Launch TUI manager
        msg <agent> "..."  - Send message to agent

      Quick Start:
        1. Start tmux: tmux new
        2. Launch TUI: slay
        3. Register agents with 'r' key
        4. Send messages: msg agent-name "Hello!"

      Key Features:
        - Press 's' in TUI for sync functionality
        - Press '?' for comprehensive help system
        - Inter-agent messaging via tmux panes

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