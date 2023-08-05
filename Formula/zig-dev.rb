class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b2a3f9eeec96e2b48e7d1570e17518aa53dca4400e8fe0ea3be22cae713bbe55" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bc2f3de59e2db2b8e018399289a56b48cd622f5fcfd74eaab9989dcf5ccb55dd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cfb5322f09cec3cf7c83a0dc522c42d062afef549a4171d15c4bfd0df335c8e6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3+9c05810be.tar.xz"
  version "0.12.0-dev.3+9c05810be"
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
