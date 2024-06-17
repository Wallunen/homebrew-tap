class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fbcd721a0c3aa220ad5dc1e9a5530cfe55a365368afaba1d7200843f090e745e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e4440e0cd5578081fae7194275ab78c5859c22835d6babdf140c56236bd333d6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e01434b7ea92b39e1f64da215593928bea7453f455aa52182262c0e2958e7ab2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.42+17f14e1d6.tar.xz"
  version "0.14.0-dev.42+17f14e1d6"
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
