class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d7d946b2197187d4f5200571894716cc715e8b4b4f9da36ef8d24c4dd709d5b0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cabb9a85aedf310503bec80014521c374c88f5f157c902db3aa7447a0a7308f3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d47604950022e7459b6768996ee21779a773105614f7c7fa250b6d31f942b964" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.396+55f0d8b41.tar.xz"
  version "0.12.0-dev.396+55f0d8b41"
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
