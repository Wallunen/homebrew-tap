class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260330-090528"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "dd93061acbe28c51a40708efd20aef4e8ac4b3b4c7b62f6105970e080a0fdee0"
    sha256 cellar: :any_skip_relocation, sequoia:      "63fbc787c7d7bc2b30b9bf8f86fecfb879e78f1ee479f0b62c194de3b96eae04"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "14c0dbd85b4c5743f408e708250d594fea75289f4d4b9ac205468050a5ddde1c"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8d9b7a6aacbbc08bc05e913fdae7f37b7dfe09fa600861372b5364b8a2c148f7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cc50337824c49d44a869ab88430385d79d1e40607ec292f7ba00f05425aa7f06" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0d15df9bc74ca7309707d5e195e672a4ec24d2429e2ecf007c1c0e2c7fd84902" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3039+b490412cd.tar.xz"
  version "0.16.0-dev.3039+b490412cd"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
