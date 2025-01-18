class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d7716013861efd2d0ea50340c0d3d8b642d314cc524f92950a4c5c8f872e877c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a954f53fb326dcc2abda2b1cf317c76b346f8b434f05be1185a217a7d322a059" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "144fc9336104ea5439af08bc164389f0a8cc5ec593a5485bb43433e2d81f5b7c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2802+257054a14.tar.xz"
  version "0.14.0-dev.2802+257054a14"
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
