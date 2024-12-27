class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d4af48cb8e6dd992dcf3eee33dca79fba9b8ee0dd0a73c602c2ebc462d8162ec" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "94dbb03e3b8734bb206f3b6228c177f21ee6c1202aefe54dd814e9057df5d435" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8e80228bb0898a7ec54726d1848b9083cd34af200f3a4958b689cb58a13530aa" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2568+42dac40b3.tar.xz"
  version "0.14.0-dev.2568+42dac40b3"
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
