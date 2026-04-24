class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260423-171416"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d1a020707a6a9c359c47020b008b4a5d6d5b6c2c5344d6917521a66177dd6bc8"
    sha256 cellar: :any_skip_relocation, sequoia:      "5b2bfea78d91cb849dc296e8cc177d610812d412651bd062cecff65e95bde136"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e6735fe76d4b555da2a1eccd370b08529b51ccefdea6c2570eb7f27c747ec7f1"
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
