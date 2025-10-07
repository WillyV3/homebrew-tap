class NextjsTemplater < Formula
  desc "TUI for scaffolding Next.js projects with shadcn/ui and authentication"
  homepage "https://github.com/WillyV3/nextjs-templater"
  url "https://github.com/WillyV3/nextjs-templater/archive/v0.2.2.tar.gz"
  sha256 "b6eb28d62ad6dd3aa0adaa93a7830018dea1b66d84af81272b8e187abdad7775"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "nextjs-templater", shell_output("#{bin}/nextjs-templater --help 2>&1", 1)
  end
end
