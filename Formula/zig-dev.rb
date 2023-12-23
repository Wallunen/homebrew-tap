class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8b1b0080822c7d0a3c334208d2d2429bce8ae55ec7ff03fa7adec653915ad3b1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5ed984621493330b4aee4eef946cd7ac3c8233b40c4a6d07089df9db791432e9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "90b96df1d5f171d43384a9d69a4f7000c614d5641a38cd082f5220d24ee2d6f7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1845+21ae64852.tar.xz"
  version "0.12.0-dev.1845+21ae64852"
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
