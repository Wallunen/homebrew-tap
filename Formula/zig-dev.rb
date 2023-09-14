class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1e10a6150eb208467e1b3bc8be658c58b7af007b2bc96d4231324805b4714cdb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "76b1b0076b9aef6ddbad111d125276d6a59f37f5bc99e712ca0e63bc18498825" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cb0f11a4ac1df029ab7dbf7ed9e114e7ab2515bcf980df7d682317a21dd9f884" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.373+8fb4a4efb.tar.xz"
  version "0.12.0-dev.373+8fb4a4efb"
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
