# typed: false
# frozen_string_literal: true

class VinwWorkspace < Formula
  desc "Tmux session launcher with beginner-friendly setup wizard"
  homepage "https://github.com/WillyV3/vinw-workspace"
  url "https://github.com/willyv3/vinw-workspace/archive/v0.2.1.tar.gz"
  sha256 "5d53f53b4a801a03bfd6abd5ebb8ab1f14fd1d165187f3bee43c000572799d72"
  license "MIT"
  version "0.2.1"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"vinw-workspace")
  end

  test do
    system "#{bin}/vinw-workspace", "--version"
  end
end
