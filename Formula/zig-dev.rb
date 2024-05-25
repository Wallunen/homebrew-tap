class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "94d186efd2b356919e4a4cfe76f014c7dff086083f170bb94e3fe355e79909e8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a8ee2c351fe4bd1a570b0096ce87447b0b3ab50db8512a75f7666911e5a88f83" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "440a80b3bf7d2d2fa22f600c29a6cbf0ffdec889602f3227895c63c4ae8c339a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.261+710d745a5.tar.xz"
  version "0.13.0-dev.261+710d745a5"
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
