class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f15b5288e1f1823c890c952cb0faaa35486314d3d5b00b233ff3e43e2ed5c173" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a700e032616e85d4f075faa08c7b852b78450670a9235ebac16d501ad000442e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3facd6bbc860f7928f634a7430d154ff8d14f75daf3c14e620ae7021956ca659" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.909+f9f894200.tar.xz"
  version "0.14.0-dev.909+f9f894200"
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
