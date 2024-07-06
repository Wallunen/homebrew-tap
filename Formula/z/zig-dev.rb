class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4e61e75a60a1df9c87e8ec754f21eed174418ffd1b45282bb3a6e77bfcf5e26f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fe9b3bfad2ba0c976617217d4b44cc499969712b6e32f6c3e8d6f5f403b200be" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9355fc2e0040dd3f39b81f6fac0b9483f6c7185076e3e358e4f554a01244d6da" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.183+b3afba8a7.tar.xz"
  version "0.14.0-dev.183+b3afba8a7"
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
