class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e3e8a9cc32e2b9884ee648d15df0982672dfa67548b86dfa0af27616ada2183d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b644c3c97df9d25f56a16cca0161b760da46cd64b62baabf7e0b23f566564676" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8b734072b74e5b4f3e643e334dee8c88c00d309a035404a83dd641a1b0627acd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.347+30a35a897.tar.xz"
  version "0.13.0-dev.347+30a35a897"
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
