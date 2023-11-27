class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "936d77db5e63a0c93ca863452095d67f4b8174b2e270de9562db465e29dade7c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a3a850433e9f5adb2ca07c4d42fec342bfb5618d4f5ae5c74397aeb184dbfcdd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "623e5bcd7d2f43871a68a40dd6f348b3b1cc7813b8ed6f0c122b7b5068e7be7c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1741+2549de80b.tar.xz"
  version "0.12.0-dev.1741+2549de80b"
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
