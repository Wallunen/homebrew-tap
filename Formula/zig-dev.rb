class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a6fb73a4d6af7aa2d544c1b94665185bce70d4c68d5a4e4eba4993c2ecc47bb3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "08abfff2b6f48facdf3c3eb927f533ce4d1002daadaa1fe2335aa74ca2c3afb8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e81b5d82e804673869ca0d982369172b1f338f025aee5309cbdc6afb4755cc35" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3278+9d179a98f.tar.xz"
  version "0.11.0-dev.3278+9d179a98f"
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
