class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "66fc9605d91f55edc0264a5bdc1dbb6c0db9b325124d3e067c156ed0328feeae" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "80a946646fa88f6b6aee78ffcf794089ca1cb187b676a918876f75bd2d5b3f15" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "50e55e556324988514b564df10d0aae9ec59e298bc3c830418bce6f8d1f4c6ea" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.654+599641357.tar.xz"
  version "0.12.0-dev.654+599641357"
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
