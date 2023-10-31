class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d1abc99ac86c522569cd58edf2a1997adbbd19d51d4632c68ce64829011f9f7f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ff5c777a2fab88d88a15a47ff2b6fcd76a9f62ea15107b076b4327bc33f45005" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bc74afeda922245cd1f56eeec09d18801b4804c62661edadf25880a1b6495e44" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1350+91e117697.tar.xz"
  version "0.12.0-dev.1350+91e117697"
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
