class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "aff12d08275d15905da27c0a3cbba528251eebc5c8897829e8cc20896394595f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "282069f3b3527075f494050849208594c7f81925af5cff351da6c7a1735bbcf9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d63711d50250ba2d9aaa6f681f55cce15b6496dea3eba254b3e67d20538fb96b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.881+42998e637.tar.xz"
  version "0.12.0-dev.881+42998e637"
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
