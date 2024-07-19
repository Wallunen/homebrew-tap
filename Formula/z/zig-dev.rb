class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5da8172fa336d6ef7ba40a265e110d7da94fae72a1fc05516c274beaeae5fefb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e782dbf1655b1372e55c300052e671a51449542f178df12bee572fdcdd6b8704" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5e43cc54cb4a1b29714311896a5712de563b2d31a7debba00d6c1c0b48b12c1d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.367+a57479afc.tar.xz"
  version "0.14.0-dev.367+a57479afc"
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
