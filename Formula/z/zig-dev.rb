class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9a60b6f5d448a34f2cd1666960b1295112b68d948c2923a7b1817ef505fb9bd0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1a13cf1173a10e7c453086b9935d4d6802123ea09609fb14f5ecb5e1396e01ab" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "eb68997d5f8eee59c76330fb759ec44a88f4deaf8f02ab9925a6726359d167dd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1021+fc2924080.tar.xz"
  version "0.14.0-dev.1021+fc2924080"
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
