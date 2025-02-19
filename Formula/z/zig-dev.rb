class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7239342c31ab94457eab70ff72486b2e5efaacbb2b652a31aeb9a2a3759eaaa0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8b18573bb9a635ad66172e04be78433bac0ce0dfb21bd05906b00bc90e1ef40f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "31d00cb8a9b2f60f9bc065a2c3d79732843b33ce51b5b05e30a4d512555a0924" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3267+59dc15fa0.tar.xz"
  version "0.14.0-dev.3267+59dc15fa0"
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
