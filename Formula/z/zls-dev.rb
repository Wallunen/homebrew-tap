class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260422-091435"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c890cf93985c9c0dfb3b737198f1f8df79e187dc6b5e369373e02c59e0c57bde"
    sha256 cellar: :any_skip_relocation, sequoia:      "f60efdaf72567c46cd2180ca3124f651b6ba1bcc433a754492721e1322177955"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "32d944fc08771ff90ce70fbac7f83d1c3131bef1bf01c1a3bcc838c2f43da676"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "797f862e78f222ad7c20ae9b6d703372933cd09c7a19c1fe6309ce70c73d9442" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "504707056aeb5a5b0a61f7d8bcc673c95a160b5f39dec5420022c796e1ebc64e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7ebc00b21cbaaa7be7f7a4750878a152edc6e71ede1b412951f5890298eec1d6" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.10+1ebcc794.tar.xz"
  version "0.17.0-dev.10+1ebcc794"
  license "MIT"
  head "https://github.com/zigtools/zls.git", branch: "master"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on "zig-dev"

  conflicts_with "zls", because: "both install a `zls` binary"

  def install
    bin.install "zls"
  end
end
