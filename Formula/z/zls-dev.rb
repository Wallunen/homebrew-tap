class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260424-092611"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4a232f7a3fe531765f2e94c45fa3a8027b8be6124fc4cc8ad28b4355a136aa42"
    sha256 cellar: :any_skip_relocation, sequoia:      "f5b02c4114274cab007865eec8052d5679e1b49be65dd8a4253fc44dc6bcb8a7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7174fe4ae700bb2ce4130badd17b19f5ddd92fdb3cef1aae5dbb402b6e2d10b3"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "76698b5dcb2a3551d539eb11a4f5b95163873d33eef6956a381d8b16cb15e1a3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "567822fd0bba4e35e9e53fc9b83a7b4e46cef78a0b9d2e957fa901ae1d17d07d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c4ef228f9919fd3b332f800b04080680b5a10f1c8e29e6ca0a3593b2b4c06cd7" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.11+b9eb9c41.tar.xz"
  version "0.17.0-dev.11+b9eb9c41"
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
