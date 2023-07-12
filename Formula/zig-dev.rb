class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fddf8ac8741b1c5ea8f6919470c6ebb0637f1acc58f6c57f7f7debcc15111971" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "eb64c3204d7487780f9938027f6d3405c523fd010e17c97646f515f02887aa3f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8cd6a2ee67832dd123e8daa3ecc3c9d0fe1fd4446a10070347e177d2397c75c8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3971+6bc9c4f71.tar.xz"
  version "0.11.0-dev.3971+6bc9c4f71"
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
