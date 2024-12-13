class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c07b4e12d4d9be95304764798918e97ab17150e8bb893d919e8aa363c09bfdb1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "99c3bc03fabf3c9be59e76c0854a966039658a8260a230045f73c98b4109ea0d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5dad2c40e3acc1ef4daea30655b64e693bdf58014e79451b664632a696f0379a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2443+3f7b3daaa.tar.xz"
  version "0.14.0-dev.2443+3f7b3daaa"
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
