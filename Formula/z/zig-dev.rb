class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "62eb46d5ceffab41ccee8667d6e6565ec59a3292071f9d975bd25a9bfb3a298a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4f94365e395f6f9218fdb8d83ec0fc995c94f374e5e284b89f01ef650492a6d2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "efe1cb544f9a6ab824b6edd2cef633b1f6c6f633f710c57b0f10634e6c8e4dec" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2628+5b5c60f43.tar.xz"
  version "0.14.0-dev.2628+5b5c60f43"
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
