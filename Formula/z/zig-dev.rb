class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0a810ed794d60b047c8048ee67a68abb93ddb29c64359584b42526bd61fea88d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "008e39f60fa38da6a10c9e022bbacb79740687a9fb91745e95ca1f42aeb1f6d4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d8e44439771d704e635d3fdb3f52ea95249e9cee9e9f915e192037bf94fbd222" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2340+182cdf74b.tar.xz"
  version "0.14.0-dev.2340+182cdf74b"
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
