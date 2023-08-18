class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e2d28bd199bd3009d5c6c8d76e7ee8eae1ccf7f606667e928814f3235c53c643" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e5650d497154662a850d8b94c1820dda354cfc092cfe34b3b7f359be3a663be9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5125b14bac5edb5515331df7ba0466eefaa876756e6f89bdc98836a8659912fa" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.109+f3f554b9b.tar.xz"
  version "0.12.0-dev.109+f3f554b9b"
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
