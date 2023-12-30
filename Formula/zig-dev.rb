class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8bf69349b224a168996531213a5738caa114b99efdac1b24db4d73f72bcdaa80" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e5b576ce166af87bd45250261223f17b85a513ef937687b15afaae5c2c546db6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5cef938af9fb82940b1293480c20973080166362969f47d47113be1aab23f1c1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1859+27d4bf753.tar.xz"
  version "0.12.0-dev.1859+27d4bf753"
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
