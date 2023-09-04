class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0191de12f43dde4b3da288a5156a46507afc68bd4c00ed7ddc9c4dda917c5960" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6758519f055e54f89df05e71eb294ffc723caee2147db1fc29e8eee83296058d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "09efdcb5da35ac27309991f3b304c25208dbddd8624ef035150a4782df80d9a7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.271+5cc1831ca.tar.xz"
  version "0.12.0-dev.271+5cc1831ca"
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
