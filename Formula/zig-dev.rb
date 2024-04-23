class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c732b2937ac4d32fceb79e4d265ca03100f6f6b52858c3fac66b58a09d9a122a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9eb59e7a2e00faa6e4e02e4d2cce968c2e4f51db288ea1b2f02e079a2e1caf14" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0061008e02c1b2aa0117e456594b66df477cee14169f70fe80d282d011da6c98" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.31+5d745d94f.tar.xz"
  version "0.13.0-dev.31+5d745d94f"
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
