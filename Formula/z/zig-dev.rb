class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b470d2e3016a40866773bc566009213ab9138eec23c2d3e06a073ce6fdf7ca3a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e5a211422e424d7c0782847cc5bcc394ebac752d41baf4832db6b8c3f7b00a65" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "744ae50170f2a69bc6a2357948a573d86a0b3874f85c3f9bbba7596bec996d1c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2599+ff4f2753e.tar.xz"
  version "0.14.0-dev.2599+ff4f2753e"
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
