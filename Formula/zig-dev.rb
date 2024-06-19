class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8f7e820d6b7907d4be836c421118f5d0ddef7fb99573fc8bed679f8a9bd04d0a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3157ba4dec8cb39a66dbeb264bf8a3cef11eb34f6759f33e13a01bd022a01a82" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bc568e1de0fa14cfbb831377ed767bf94528b23253004007bfcfc193b9578271" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.66+1fdf13a14.tar.xz"
  version "0.14.0-dev.66+1fdf13a14"
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
