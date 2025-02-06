class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8a502008573525f8ac3a52cd7b70cf3953e6338839cea2544bf2c2d5d91bf3e0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a79c6af1aa7bacd114f47c995952ef3babeaffbb8754068fd106c0e63f323583" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1925b583645e71dfdd769bf679e8fbbaf75dfe4520471299bfe37e1280e34517" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3047+3a4bb47fe.tar.xz"
  version "0.14.0-dev.3047+3a4bb47fe"
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
