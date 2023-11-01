class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0ecfcf28bc071eb8af30f3e4c4b3409a3c9f211b5095113375c126a403f1a8f3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ac2bd696ed168015226f24b473fdac9c274879c1c78f716c3b8a79c92cf743e6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e12024f9892e9a6b0fae9a088cffb40489b345e9c3e3dc3741ce2d45a9401a43" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1369+a09ba455c.tar.xz"
  version "0.12.0-dev.1369+a09ba455c"
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
