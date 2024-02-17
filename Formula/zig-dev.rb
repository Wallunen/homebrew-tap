class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7358ded7db7311246bf01d239525e4c654f4369f8f80c7fa09c477e6b0bcfc7a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bbcef2c152408c881180403c83d0e4c8349f91a615045bc9567702798d33b47e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c099713df6e8550b862c82aecd4e91ec73550a29955270a0241fe9b62b01a119" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2790+fc7dd3e28.tar.xz"
  version "0.12.0-dev.2790+fc7dd3e28"
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
