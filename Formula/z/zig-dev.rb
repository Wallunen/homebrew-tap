class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cf7f9a3930bee114dd1c645acefbfddd9e6b275a7db9178fd52d83c4680208a1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f1adb94381bba59fbbadf17582638bcf956957ab81c8528d242aa2775162c35c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3f2ebc34fd8190bda348b2d9fd093ab25a23fd5936c0e60f5337a9baee7eab76" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.364+8ab70f80c.tar.xz"
  version "0.14.0-dev.364+8ab70f80c"
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
