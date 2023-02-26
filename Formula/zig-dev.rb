class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "551a1ea7e49cb10a99ead1fd8ec8c56810071e173ab6b518391d8e6a52d0fdbb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e927b7ae6fb818e0033f07db290292fceb45ee5ef12bef7e2c1e218a6cabd4c3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "60c2df9d66a10279bf875ce803f492f64a3650ce764d4b958fd4ebbc9c7bb7e0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1812+26196be34.tar.xz"
  version "0.11.0-dev.1812+26196be34"
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
