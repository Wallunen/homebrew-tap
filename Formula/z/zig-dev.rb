class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "952d522aa170465bd463c1321c8e103308311d430a7f7144b889e7ddf71ceeb1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e2d4a69e7245176298d8fa5c34d1d0166ff9c5bafa0607300c4916c0871d17c3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b70f43942695145bd771ffeb3741e6d5f59d585ac6e460c15454f5c3308aa6e4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1398+c34cfe486.tar.xz"
  version "0.14.0-dev.1398+c34cfe486"
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
