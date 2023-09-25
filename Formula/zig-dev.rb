class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0b7e7e8a4e21d9615441f29ee3ab5dbbb736a721275d0aed6d0f8981fccc11c7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c281fea2c0ea4d696b152777567de6ccd34659b1297799dfd75df8d7134469d1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "31ddf41aeac27b59d7fa01faf67c3b0d5dd5402224071e5271d8ac61655942b0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.575+fb6fff256.tar.xz"
  version "0.12.0-dev.575+fb6fff256"
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
