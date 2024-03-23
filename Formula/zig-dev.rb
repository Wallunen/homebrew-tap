class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9d927ad6c0ebd998cc41c6a724294f5a8f96c43bdbb48f7a376b31f0fbd26b2c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "282d09a21c29899ecd977949f5bda0c51e55393c4bdb94fed285d1d02adacef0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "50d21597e20e6b54e8cad2e301c62c2c29a17f487b23d8d2b84a17747e1ed433" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3429+13a9d94a8.tar.xz"
  version "0.12.0-dev.3429+13a9d94a8"
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
