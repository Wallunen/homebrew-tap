class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d03a411e185ba2eecccc7bcb83581b48423ef4e2a5d085e2a0790f7a178fa54d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6307323033f266a0afff3f4d072aa9390e511a1ac07588ac815de14b0fe7f379" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ef45119392991ea2f6eca2cefadbc1fe7e7527fff1c0429de8d88f244289a9b9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1710+8ee52f99c.tar.xz"
  version "0.14.0-dev.1710+8ee52f99c"
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
