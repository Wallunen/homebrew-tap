class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cf58f0ce714936e93ef5a7d59d0aa670323497165af66fa951cc148d0e693ca9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b8ecd67afc968e6e6aa37886d07aee1e28299e1a8ea9ce7d1d480a0f64f5e09a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "956f45f0ae962f7f26ac50b83a06df31bf6786e5a6c0f91d964bfa3b3f944946" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3218+b873ce1e0.tar.xz"
  version "0.11.0-dev.3218+b873ce1e0"
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
