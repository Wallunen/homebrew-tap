class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "eeb4158feaa2d0696c172f15daeaeff19d9205f00ab91845eede5640f032fb90" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fa28eea355320757104187ec7098db2e89145a8d3b3e3c255708e2437eb514eb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "89fc7e00a229024e541a3a4d4a4de2e2e2f107b3410ccc479490b2494ff9b8a4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4334+928d43f61.tar.xz"
  version "0.11.0-dev.4334+928d43f61"
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
