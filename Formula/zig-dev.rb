class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "76226ee1c53997a10b825208461a04e2466f5cbda0a7a47bd519f8f3fb4597b1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dc94458bddd2c64b8f0e92e303072dd76d6343e86dac69df3ce27326189fad80" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9d9fa17084d86d8f35e6afe902bc6407c18f963e7dcbe47a993cbd425b8a82f1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2777+b95cdf0ae.tar.xz"
  version "0.11.0-dev.2777+b95cdf0ae"
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
