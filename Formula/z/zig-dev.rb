class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "231610d0b39f35c379b7ae72848338ee454d38713de3b4040c621cbe70805177" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d34c0e18310c8478a909ceb599f04e64d5c2f738b1459d86754e7cb453980e3d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5d4c941b100d7eaf29013b5ca4b5fb9c93065562aa39ac16a69ae71263c27d2f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3241+55c46870b.tar.xz"
  version "0.14.0-dev.3241+55c46870b"
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
