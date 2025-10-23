class Distributed < Formula
  desc "Distribute workload across Tailscale-connected machines with intelligent load balancing"
  homepage "https://github.com/WillyV3/distributed"
  url "https://github.com/WillyV3/distributed/archive/v0.0.5.tar.gz"
  sha256 "4cc51078a75cb8f28bd6d282b5187cab9a98a19b4d3cc66674c79132750a3996"
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
        dw config              - Show configuration

      Requirements:
        - Tailscale network configured
        - SSH access to remote hosts via ~/.ssh/config
        - rsync installed (for sync operations)
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
