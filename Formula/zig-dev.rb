class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "85c152d8bd5f775d2c7757df67e753f0abe29a89d29b82afb6e83ecd49d5fc0c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9d67051dff9bda4d21822e6ae1d22e87b81a858cdc915da72f461d492d62ee97" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6a4be1fcf69af994828f128614345f7782e20abc91f2cad215bb408ac8d01859" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3739+939e4d81e.tar.xz"
  version "0.11.0-dev.3739+939e4d81e"
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
