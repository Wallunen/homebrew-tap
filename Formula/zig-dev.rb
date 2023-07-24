class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "559b92a61bd0d4e444e6d85186a9b73c927d09d77d2985bb5ff3e4924036ba99" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "137dc4ebafec590de018d7d23a88247e23c2dfcce41608e86be488463c18cafa" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6d3dd83dce2d5c9790ec70e0d9050b0ca62efa8d8ccdac32ce46e288d5f0d06c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4191+1bf16b172.tar.xz"
  version "0.11.0-dev.4191+1bf16b172"
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
