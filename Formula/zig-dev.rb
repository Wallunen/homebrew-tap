class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "dce6a029efaa4f1f96f4905d963c57ef25c50c3d4502cee7b8884e9e4f3bfbac" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e0856027ca7fc57c6b1c98906af1f7e521f12014812b0fc54f0b8df1f7f9bc38" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "94c368b8b81328d0c44f22d53f78a11099bba65561e896748e59f9d57d5df859" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1502+b3462b7ce.tar.xz"
  version "0.12.0-dev.1502+b3462b7ce"
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
