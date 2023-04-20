class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "63568d95d1778ab1122663c343a219e5ce920d60682cb27ffb895e60652f8b80" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5997dc7df21f21a55969138f163731df8b0755db0d19d9fdfee5aea91fd2ce16" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ce8e04259b95c8696c759ba8bd139c01bed2156de06bacc77528bceba9f5a4cd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2661+d2a799c65.tar.xz"
  version "0.11.0-dev.2661+d2a799c65"
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
