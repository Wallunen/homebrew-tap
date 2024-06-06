class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6848447192c2fbd76addd71e44554db294eeb0a557f0dcb7e743975813691973" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3fcf09af85947c6f6a85fc9ee31e3395a4ef352912143c9aceb0873dc9edee99" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "12ca5a15bbd6d6819c13ab62912c0bd654def59a61c2034e5c8770d6b45129ec" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.386+3964b2a31.tar.xz"
  version "0.13.0-dev.386+3964b2a31"
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
