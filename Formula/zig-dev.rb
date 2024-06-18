class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fa7ae73f4d8f05bcfbc46fcaf386abe714de07fea175fb88550cefc3c149284d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cc784ca78ada9a996763d23090b18b9b1f936d30793ebd4ff3a2ba13aba36ca8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "40d76120a033375b5b043668a847b23232ab0fd33d8d583ae96043647988433e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.56+455899668.tar.xz"
  version "0.14.0-dev.56+455899668"
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
