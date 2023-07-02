class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "69a87103b7001019baa289bcc7d90b066b1e04abdc5e5dcddf3dc7617837af9e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d74d5410e534cfa5956dc9e26221f5fbbb086714a1f169f55be14064de595034" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7fed35bafcaa69b288d3940a64c163105113f0b982ac968d2d61de217755f27a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3897+f571438fc.tar.xz"
  version "0.11.0-dev.3897+f571438fc"
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
