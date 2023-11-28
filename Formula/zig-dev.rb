class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d17f6eb58dfe379a9a0539fe772ad16a3f5839b893fed669789f29aae830f5ec" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fc8dfbf38f33150e156cee63b4536ee9709cab2099904926750b90a9447e6f8b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "60896f530eadfba92485ad5050fba9bfe2e74703895493af201f536ba1cf269a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1746+19af8aac8.tar.xz"
  version "0.12.0-dev.1746+19af8aac8"
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
