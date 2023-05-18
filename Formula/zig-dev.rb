class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "aa2f1c278653009908a21b07918eca32df77fdd26461363cff89e8add8356599" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "02fbeb4a7395df930068227bb89ef5d296fc63999429c7507739fb3bb50d716c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "64ad48a8c3fff776b807e541b0926f4769dd60df1d84440e9f311174574c192f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3187+40e8c2243.tar.xz"
  version "0.11.0-dev.3187+40e8c2243"
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
