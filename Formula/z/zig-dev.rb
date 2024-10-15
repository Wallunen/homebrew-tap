class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "07dab7e71d61465bebed305d2c8bfae53c5f3b9422dd8e481f1b04bf3812c54b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fde79992e2f60d8a9155cf0d177c7c84db2a5729f716419660fc75f5d1ed2a95" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "73347307b8fcc4d5aab92b7c39f41740ae7b8ee2a82912aecb8cbbf7b6f899fd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1911+3bf89f55c.tar.xz"
  version "0.14.0-dev.1911+3bf89f55c"
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
