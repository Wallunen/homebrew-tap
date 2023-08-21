class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ce982e865bfb6d081cad657b798940b7af0ab736aa25a50be1ff8df9443d564a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "35ef3718ba350d22bc9b8e151ea69c26a8b9c7cfbd36743320526fc91997732e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "22f882d27fbb4ff6c5d05167d035ddb862eab3bd173590a4ce66e88b8529c386" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.152+411462e1c.tar.xz"
  version "0.12.0-dev.152+411462e1c"
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
