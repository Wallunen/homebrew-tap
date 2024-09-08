class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8479fa01abc74d4dde587c49feaf70ea8f85552a28aee865349762608278cb7d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "36c6b3c7a91252c98580a7fdd42853daabad1137e1d7e5942108e63d9b1033c3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ff7a5d4f6fc1fc6136b25299c0c5aebb6113df65361b6408277bf93bca55eeec" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1504+5f3d9e0b7.tar.xz"
  version "0.14.0-dev.1504+5f3d9e0b7"
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
