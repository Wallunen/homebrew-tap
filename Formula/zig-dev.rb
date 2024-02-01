class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8f11f310b928ed5cc905058fcc91d0cd2a9bc8bd8c1624297a7a6b91af0e6365" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9e908b745a2633bfeacde5103358e9e45934448fd87924b07b4abfb4b3f2cf32" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f3553362fbe0937a8cb6d95cdf77a1d148a3c33deef73f649feba897f3c8b7ea" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2536+788a0409a.tar.xz"
  version "0.12.0-dev.2536+788a0409a"
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
