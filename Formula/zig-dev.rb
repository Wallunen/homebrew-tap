class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8062f550ec4eef29a3faf02e40e144e592056938d6971c7dbcd59b11f9804c76" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7e3877ed168e8872c419eece01d41241c51bff1667a5a13cc6d029aac1e30731" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5c401d9839f83355059b375ad15fda6ab11ef120ce497c02485ee3105678c06c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1817+f6c934677.tar.xz"
  version "0.11.0-dev.1817+f6c934677"
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
