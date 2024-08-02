class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "34c7ad8c0baf97c073790b2251897fe8a7d6576d8299d5521c34eb267b5fccec" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ec402ddb0b2b807648fcdba1b73732e373a9e09c74d351155ffef6585b907c6c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0e7b2f1f5ddf05de591f89137d9e79c39ff28d6c2fb8a2e234dbbd0d0920a21c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.823+624fa8523.tar.xz"
  version "0.14.0-dev.823+624fa8523"
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
