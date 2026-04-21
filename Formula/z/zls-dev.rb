class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260421-092003"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a9c2dd84f3ee129949f66e0951f39be6e58ca329fcec0c26eb507994ce35c172"
    sha256 cellar: :any_skip_relocation, sequoia:      "fe36c3931b8c1266a1e358940f82c50bfcce931212a6ae6fc677916541d7dde2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3cbc0b2b886bdc13bdce9d66651b8f946cb4ca924f4b8ca7caa68cb1bcdbec84"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "79881dd98fa582726bb50b5f3d5f2aeeeacf7c582f30d443d786c8f569ba1849" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "274abfda456bde652ea1da5d3fece49526815364171e657298fe8dc3349731c6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4f9c5d7d141e270aaa4d644a4e92174960c75605c80f6ddc1c94da80d2cddfaf" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.5+a786b027.tar.xz"
  version "0.17.0-dev.5+a786b027"
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
