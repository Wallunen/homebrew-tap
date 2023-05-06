class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f4e82ffae344f761465ba60aebaaf8d93995dd6d5e5cc654133f4d98ff49819c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "14a755839c16cd59accbe9585b967b1d615f02effe15090be2a46224fabf0138" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "dbb8a9ea1c34fe92587a6dcaf27f0d332188db9bfb2222c963d99bfa9b488b3d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2995+d70853ba3.tar.xz"
  version "0.11.0-dev.2995+d70853ba3"
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
