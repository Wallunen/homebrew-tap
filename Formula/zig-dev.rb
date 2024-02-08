class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8135bf540872a469fa5759e8b19aa8a8073d7b067e8e20d64bb0504d5cd81c70" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7c6ca89d6f6348b09f19eac47a4677cb11b2424371e620e75470e56af5dbf4c4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "95d43178b7b5d3027091114770ac5e698933a7d2b24a1c47c49f6839c073bc6f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2641+ee36131e6.tar.xz"
  version "0.12.0-dev.2641+ee36131e6"
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
