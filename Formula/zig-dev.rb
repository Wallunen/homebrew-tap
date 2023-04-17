class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6470a28088dc8a618b1c585374879480a871c9589513789f439d2dc42f875e7a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "150a7b94d3e5fdfff07e9446f818f1788aebc912fad3f21a730f88909f6fc0d3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b991651cb6624ac83daf94dd36bce67ec60a3b6b0be869572a8c642f81d8fba9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2620+23ac4dd87.tar.xz"
  version "0.11.0-dev.2620+23ac4dd87"
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
