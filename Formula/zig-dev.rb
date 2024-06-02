class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7de18dfc05fc989629311727470f22af9e9e75cb52997c333938eef666e4396e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fef4c33cc8b2c9af1caf47df98786c6bc049dd70ec6c05c794a3273b2937801b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "351bcaa1b43db30dc24fb7f34dc598fd7ee4d571f164a4e9bc6dac6f6e6e3c56" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.351+64ef45eb0.tar.xz"
  version "0.13.0-dev.351+64ef45eb0"
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
