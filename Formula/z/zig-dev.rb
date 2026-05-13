class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260513-102000"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ac972c24ebfa5ac47f2533b9d7ad67532dc7c3290bc9de8e9aa5540f2b1818ec"
    sha256 cellar: :any_skip_relocation, sequoia:      "089bb2a752dcb0f496ab1e88b1296b63db94f855cdcefb698f9189db5e32022b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fedd561399e674ffb79b861d5139a2f2ce5376348dbb8804ffdc486850540524"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f05893b1d0bd3eb2c6d3fb1eb9d34af484f4f53546c73c83f86a8296058a7244" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a503bb25c17cd5e4c75f07aab35eb5c990809c440afd7e6f40f7935a4c6a6767" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "844305bfdeb617aecf18faf633d1b4719d9be38d55cab19a4a2378f801f53861" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.298+ad1b746e2.tar.xz"
  version "0.17.0-dev.298+ad1b746e2"
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
