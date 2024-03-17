class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0c9c6691a81427f54066fd231bd6f8add183c2cd5136c16f936004870ee1def9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c48e0b76c7c4650ead9b159acb48323995386243e1b915d6b33e399e28ea44ab" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8d0f9710ad7605401da155dc059e95424be30eb4b3002f592bb0312552441dfd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3333+ce4245f87.tar.xz"
  version "0.12.0-dev.3333+ce4245f87"
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
