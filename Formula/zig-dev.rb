class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e132899fe3000c3bdac8cad2300d2bdcc6041092d031beac7321cdd0ba049c19" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fe7c9225516e43bb47e5a4bdd565e9aae2ae8075833f89f97c9dec8e649cdb38" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "257e137d6d8ec951318d184422f10d47facb1372750f8c419f7ca26d4b165bf1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2612+56d800ff7.tar.xz"
  version "0.11.0-dev.2612+56d800ff7"
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
