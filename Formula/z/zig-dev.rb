class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "95555453d6df0d8fefbe033eaf5d6e3495fcb945e274080569defbb7766149c9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fefdcfc168aaee721c4b5c2d5307639707816655bfd10643e7aa9ca97393d270" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "25ff6aeae46863ce160052690ca2a5026dac0a7df06b32a39c33712f9251ca2a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2164+6b2c8fc68.tar.xz"
  version "0.14.0-dev.2164+6b2c8fc68"
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
