class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9a909281bebb63bc31ca2cc58f0bd3e3e20fba45c954c343573752c9b75c9322" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c25329d9000f6ef079f07fc47bad3d76fc2c43f0b5da87a61fa1113298c54102" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f829ed989de05f6e49d0aabf9d04fdfc1d022101e1d04fa0c7d5552b3dee430c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1930+a097779b6.tar.xz"
  version "0.11.0-dev.1930+a097779b6"
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
