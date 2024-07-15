class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8c21953f3b1a6b788dad44e9eed541c99bfc8fe3a6ea9fdb88e63f4b27e7ceaa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "460e3465f0ce43fdb11e80668645ef5a2fb48a24a1a836c88a8136dc4d815699" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e74382d61dc0b61edd41e22f17442d774a23d4eec9ca840105b1e0f034100334" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.296+bd7b2cc4b.tar.xz"
  version "0.14.0-dev.296+bd7b2cc4b"
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
