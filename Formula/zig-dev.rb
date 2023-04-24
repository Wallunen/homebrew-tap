class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8d3f380c9501fd49470a3df464c9be05f5c71877c9c41a79ca58e3a78a2eb5d1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3cb50fddd9bc3a370b15b2dc99fcf53291bbf3fa869f6f143f9a9eba2c75d4a9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b95e8c2601a11e8b8451d8527e9491ef3ba15c99bc56d2901766265e360782f0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2750+c4a63389e.tar.xz"
  version "0.11.0-dev.2750+c4a63389e"
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
