class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260513-175703"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b6d81590b008332c73ef23c0b16839bc2e79384a8f6b020bc9f0f57144b0accf"
    sha256 cellar: :any_skip_relocation, sequoia:      "ef52d72d26781c3e723dfc465bb60ecb45ca8ff0a04f2d21294d4cf227bd912c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4c073a2e41a3c7d6ef4a71d7e40e4bc83a2cdb3e92a3a0b7c1795e632eb91f51"
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
