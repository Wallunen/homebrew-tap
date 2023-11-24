class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "84dc184ec2104ae2b1dfd82c4634ab16db6fbff65dde9997ae5e3a8328d7894e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ce6bda00c1d65ea97b8b35b61ed17b6270196b300ecb40e35aeca23fa32d33e2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "675628ad9136d2d49e1047bba6a2262240be0ecbc013603f59e51169e6f90a4c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1717+54f4abae2.tar.xz"
  version "0.12.0-dev.1717+54f4abae2"
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
