class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "94496beb0cf50e13f78cd29e212b33241b64593502a6a5965d692e94c85dee1e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c5270e6106f08a0fccecee8db97686b6213d5b5c436ff10c123f43c84e633075" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ca1b7c79aab651e037846c72642da6f1b36c6d256915f023d88c1c67dcb5f877" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1210+54e48f7b7.tar.xz"
  version "0.14.0-dev.1210+54e48f7b7"
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
