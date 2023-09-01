class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "630a29524f0e56fe9b4982b155479b6a02674b17af486dad20a41f99886e036b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dc1bc2f9d817cbd0c32c497eefe3969b3edabcf2b0d89cc1a5ee53fefd0a48b4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b9bc50e95b6a16df78060de62ee4f032cb6966a63f45ea76a81c1b702e628d94" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.244+f4c9e19bc.tar.xz"
  version "0.12.0-dev.244+f4c9e19bc"
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
