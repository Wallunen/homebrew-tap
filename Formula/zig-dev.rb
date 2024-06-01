class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "af4a3765a5ca95d51f12ecd2691953dd14b6b3f3546049a1cf05c46248202570" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7b73fe96a4f416ad7e6dcb0b868744341f6352c861997a222914d978c3e663e4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "458dde358b717764ca95ce81911eafca89321d2969f0755801bcff65c951005d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.348+c564a16a0.tar.xz"
  version "0.13.0-dev.348+c564a16a0"
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
