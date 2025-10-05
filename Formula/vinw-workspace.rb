class VinwWorkspace < Formula
  desc "Interactive TUI for launching tmux workspaces with vinw, vinw-viewer, and development tools"
  homepage "https://github.com/willyv3/vinw-workspace"
  url "https://github.com/willyv3/vinw-workspace/archive/v0.0.2.tar.gz"
  sha256 "320d8f47ab498ae204537746e02257daa90cdc93edcd55b15e6c54a09d7f200b"
  license "MIT"

  depends_on "go" => :build
  depends_on "tmux"

  def install
    # Build vinw-workspace binary
    system "go", "build", "-o", "#{bin}/vinw-workspace"
  end

  def caveats
    <<~EOS
      vinw-workspace has been installed!

      To launch a workspace:
        vinw-workspace

      The TUI will guide you through:
        1. Select a project directory
        2. Name your tmux session
        3. Choose terminal type (shell/nextui)
        4. Choose coding agent (none/aider/etc)
        5. Preview and launch

      Layout:
        ┌──────────┬─────────────────────────┐
        │          │                         │
        │   vinw   │    vinw-viewer          │
        │          │                         │
        │          ├────────────┬────────────┤
        │          │  terminal  │   agent    │
        └──────────┴────────────┴────────────┘

      Requirements:
        - tmux (installed as dependency)
        - vinw and vinw-viewer (install separately)

      Controls:
        ↑/↓ or j/k  - Navigate
        Enter/Tab   - Select/Next
        Esc         - Back/Cancel
        s/Space     - Search directories
        n           - Create new directory
    EOS
  end

  test do
    # Test that binary exists and is executable
    assert_predicate bin/"vinw-workspace", :exist?
    assert_predicate bin/"vinw-workspace", :executable?
  end
end
