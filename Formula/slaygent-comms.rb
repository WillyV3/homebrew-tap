class SlaygentComms < Formula
  desc "Inter-agent communication system for AI coding assistants in tmux panes"
  homepage "https://github.com/WillyV3/slaygent-comms"
  url "https://github.com/WillyV3/slaygent-comms/archive/v1.0.2.tar.gz"
  sha256 "de95cf1f2f9e2560b36f27dfe2e8a3d7f2e8aa190f7ccd5aaef51171d78d7b75"
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