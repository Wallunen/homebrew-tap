class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7f69d3c56539fdc2bf3f72cbaaaa52465026f39776650d1cc2050e187c0ab0d4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b1343773ca68876f26c16a59abdbd737d5d01608ced1d231f49149da205d32a9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "dcbffa0ff291fcf6e33ce949d4d518f41f18756725172ac35baf820ed6cfc674" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.281+d1a14e7b6.tar.xz"
  version "0.12.0-dev.281+d1a14e7b6"
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
