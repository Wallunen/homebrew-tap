class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4087c849cc0f89c79501f2fd4e690579c9b1f9dc2fb2d19bbc9e1df1831f0295" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fe2f828b5327fe67688a5ab31eb7dfdaa44ceaa94c1c6473a807d2ccb93973df" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "98b527416d8bd462c7af5f6aad8ae6a75c0fd22a912f544d8c5c0c5dc19249f9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1588+2111f4c38.tar.xz"
  version "0.14.0-dev.1588+2111f4c38"
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
