class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "17a1a4affa64772612339fad2b7035f3a81a9be0984743e5024d8cb6696f52c3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1fd5c421ab5d39484be5677493aff765fba140db4cb6226e9a2df5c783adf227" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6ab8f2d905f4ef8d61f87d2046a0f5e7d2b051fc62f27b62a9ee79b37315a646" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2729+0c725a354.tar.xz"
  version "0.12.0-dev.2729+0c725a354"
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
