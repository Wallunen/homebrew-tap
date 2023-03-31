class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9527106332d839dbbc0f0073b0e7b1c7d873e34866eecbb48bee3331cf7b988c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "86002c20fdbf103c278ef3bb5e72661fbecfe6471a8d7b554cb9d291a7f94bbc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "637d0f87b2cb409e1fad28e1f65a4f3645ecda467e4e2f96fe9c6959937f7c93" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2336+5b82b4004.tar.xz"
  version "0.11.0-dev.2336+5b82b4004"
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
