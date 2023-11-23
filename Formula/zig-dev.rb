class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f433faa807315eb2f5d85b4cd297d916fbe623656cba8024e7d71d7f080ebb13" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6402af39555992c122e9fbb83360c65850c089b7ef99e314fbd5d066c6f5634e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fd2d8281d552bbbda992e9169491b4bc5950a5dbb02e0ab20898a6d3c1c0c73d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1685+994e19164.tar.xz"
  version "0.12.0-dev.1685+994e19164"
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
