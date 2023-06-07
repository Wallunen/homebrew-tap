class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "74279d92d09a2ab287b777f799d7f27a662f716d9e3348285aeb7f2846d82e43" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9f5c0d0de50562a4444493f1ac17c2973990454e1a792834d838551b76cd1802" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b2cc6252405d3e2afd2d493a381624871b966d660018ea6bcace597446ad3131" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3382+c16d4ab9e.tar.xz"
  version "0.11.0-dev.3382+c16d4ab9e"
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
