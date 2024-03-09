class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "38faf1889ec0dd618d88041fef29920df7cb95958a776d9e6db9f1166389e16f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b4b5b199bb9e048d71cafa0f5a801dfc6d0c6c206e41db47fcde37742d9f3252" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f5e14decf71e4ad7f002524edeae405dbe475db3937e5df07af98ebc5291f501" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3182+f3227598e.tar.xz"
  version "0.12.0-dev.3182+f3227598e"
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
