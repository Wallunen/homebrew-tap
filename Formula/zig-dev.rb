class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "02f5836c2577d7032965a4884a47e4e76b46e862ce6212fc11cdb724fd23c0c3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2b993d271a0c864ece03695a7f77856c28883a73376c58abadf2a4ec27bc053f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c3ac968c481e6d50f16bef5b370313275bea781a64ebd5e61be0c200c7576777" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3352+95cb93944.tar.xz"
  version "0.12.0-dev.3352+95cb93944"
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
