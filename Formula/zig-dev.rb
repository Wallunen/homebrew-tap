class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7c30ee67f42fc4bc1579d628a462e1179d374266f1c453eebfff78ffcff2c820" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8dea022fa828a9778bfa78b31301f3d6c32b77ab7250d8d5626cf6143a0e3fbd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "39006b2b80474feac517b87db4a17371367f4103a9d533314f258a94034f7172" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4003+c6aa29b6f.tar.xz"
  version "0.11.0-dev.4003+c6aa29b6f"
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
