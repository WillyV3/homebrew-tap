class Distributed < Formula
  desc "Distribute workload across Tailscale-connected machines with intelligent load balancing"
  homepage "https://github.com/WillyV3/distributed"
  url "https://github.com/WillyV3/distributed/archive/v0.0.3.tar.gz"
  sha256 "dd10e5f5277097cb0e5cf469e01f893c3a71f94319b740a474d0cd01526c2047"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"d", "./cmd/d"
  end

  def caveats
    <<~EOS
      distributed has been installed!

      The CLI is available as 'd' command.

      Commands:
        d status              - Check status of all hosts
        d load                - Show load metrics for all hosts
        d sync <host>         - Sync current directory to host
        d run <host> <cmd>    - Run command on host
        d tmux <host>         - Open tmux session on host
        d config              - Show configuration

      Requirements:
        - Tailscale network configured
        - SSH access to remote hosts via ~/.ssh/config
        - rsync installed (for sync operations)
        - tmux installed on remote hosts (for tmux command)
        - gum installed (optional, for enhanced UI)

      Configuration:
        Hosts are automatically discovered from ~/.ssh/config

        Optional: Create ~/.config/distributed/config.yaml for groups:
          groups:
            dev:
              - host1
              - host2

      Load Balancing:
        The 'load' command shows composite scores based on:
        - CPU load average
        - CPU percentage
        - Memory percentage
        Lower scores = better performance for new workloads

      Sync Operation:
        Automatically excludes: .git, node_modules, .DS_Store, dist, build

           [NODE]─────[NODE]
              │    ╱ ╲    │
           [NODE]─────[NODE]
              │    ╲ ╱    │
           [NODE]─────[NODE]

        Distributed Development
        Pure Unix Philosophy

      Blog: breakshit.blog
      Website: willyv3.com
      @humanfrontierlabs
    EOS
  end

  test do
    assert_predicate bin/"d", :exist?
    assert_predicate bin/"d", :executable?
  end
end
