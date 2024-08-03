class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "03b5249b63a675caa88f2e7e2e7ad615e6adc07386694567c67d517e474c9037" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c47cee576b0ae46e0510ea66cc4e1ad67ea34234ac06e0ec48948aed87072179" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b497501e0280421e45149e776a1d87f4733d1a276024237a77a5e93f5d74abdd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.839+a931bfada.tar.xz"
  version "0.14.0-dev.839+a931bfada"
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
