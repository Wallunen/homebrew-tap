class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "eb09fd4b7563f70f7ba71632a67b02273e4b8efb106411bfa9bee2d065586601" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "abcdeddf1a0acaf3985f8d7741546a597e03679763772aa35c10f9c01d2f0971" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "28841864c9a324fb2c475e46c43e3ae456c97f7181cd241939887a5f5e84f9bb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1261+c26206112.tar.xz"
  version "0.14.0-dev.1261+c26206112"
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
