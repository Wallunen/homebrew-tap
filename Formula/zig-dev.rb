class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "66d8ae5e5d00aeb20e2e1329398ac1441b6e97992b1c3961349831eef6cd6ddf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8b6605ede6e039bb32c9b9f81c77151d8ae12bbb9e71b172ecef5c7e68bc7976" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "da2c4226ab5af3fd169675a51845ae8d1c7fb0a7c8868a74edc9af1064e1c55b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.694+937e8cb70.tar.xz"
  version "0.12.0-dev.694+937e8cb70"
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
