class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4989c0221e82d6e2566e3ac0488b522504042c0249b9ca871a042ada5ccd1d5c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "14b96046c919c571af5f76e16d8af73a8dd4354cabf8fd04585e4c2da0c21075" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8a5d58be24b514b656467e684c40bf4078988972b387e49da893d245354a69c0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2805+79e99c401.tar.xz"
  version "0.12.0-dev.2805+79e99c401"
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
