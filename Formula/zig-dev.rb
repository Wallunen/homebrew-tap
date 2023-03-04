class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "53babe365aab7f0095795d72b422997ded5bae2bcf71cad3d6e15afa3ba13540" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "70f3e4ac9bbe2677b6c4668bc362d5ff7f21a6f61d499f0601e29545b4801f17" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ebe2d55e74da61bbf067caebd7f56c342bd44785297824077d435ec788a64c61" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1844+75ff34db9.tar.xz"
  version "0.11.0-dev.1844+75ff34db9"
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
