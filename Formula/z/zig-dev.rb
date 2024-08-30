class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fa0b54ecf13b91c061fecc1e997e4637b7714bbc0f018e094ea1068300af2ba4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1a27f01fec4555ebd840f04fc68f46bdf9934f655cc49d536fbfe3798a982049" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bcecca42d01b89fcda3a85260d3ea92189b8306455d2f80f002e290a2c19423a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1366+d997ddaa1.tar.xz"
  version "0.14.0-dev.1366+d997ddaa1"
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
