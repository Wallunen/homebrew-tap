class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260512-175452"
    rebuild 3
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "abd0245f1e3cdcc9bdb91407718d1910a7c7ac836d8a0a7f72ea20550d38ec3a"
    sha256 cellar: :any_skip_relocation, sequoia:      "88ea9f07ce6809942be4a0fdf7774e6e5d76c9e83918800a7003d12f5b236298"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cbf7b8c790ffac8f439081f4769551a7d152057ed19243e9336974df879ee2d4"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "79e4d7342540c61a1bff889e834989708717d3c7faab773a84852e820df0897c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6e909c9f7fcfa978ad729b9a9d07d401a14aa7d92ca03d4c7481cc2ce6f4bbf1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3cb3f88d7d43f33e70521a9248b6659bffc835cb03759bc54143e46d87c4d5ab" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.35+5d97c95a.tar.xz"
  version "0.17.0-dev.35+5d97c95a"
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
