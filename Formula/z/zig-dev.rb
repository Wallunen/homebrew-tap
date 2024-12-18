class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "455575fe32d27cbc3aaa1c81365d8e60d0cf1956c49f085dc1adcd961a94deff" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6fefa2769b8ef4a1bbe206492a33242fba12862ed5c7264c938d71a3262f39c8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c504503f56083200f920de2eab784ff637070c1ad5e113cbaeb2c2134e31f55c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2509+0c457fa7e.tar.xz"
  version "0.14.0-dev.2509+0c457fa7e"
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
