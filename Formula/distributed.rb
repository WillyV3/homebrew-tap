class Distributed < Formula
  desc "Distribute workload across Tailscale-connected machines with intelligent load balancing"
  homepage "https://github.com/WillyV3/distributed"
  url "https://github.com/WillyV3/distributed/archive/v0.0.4.tar.gz"
  sha256 "d0a1b72b8736738164c82a111cd70c6c0cdd174213fa9ac0de1adaf23d6845ca"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"dw", "./cmd/dw"
  end

  def caveats
    <<~EOS
      distributed has been installed!

      The CLI is available as 'dw' command.

      Commands:
        dw status              - Check status of all hosts
        dw load                - Show load metrics for all hosts
        dw sync <host>         - Sync current directory to host
        dw run <host> <cmd>    - Run command on host
        dw tmux <host>         - Open tmux session on host
        dw config              - Show configuration

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
    assert_predicate bin/"dw", :exist?
    assert_predicate bin/"dw", :executable?
  end
end
