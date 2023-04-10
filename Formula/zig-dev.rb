class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "61ae26cdefd01d89e5a869c1d9fdba6abb9fe1fb84eb9a91b102b02f7d2c797c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9b656bdfde49a8f51268df0d2a2ce2058d4841ce454003706ef37024c4fd78c5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7ad9fdfe8abe075898b9b682d1afc523baf40ab2171ad100910a267c535b4d86" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2477+2ee328995.tar.xz"
  version "0.11.0-dev.2477+2ee328995"
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
