class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e14975f9eb85f0799a068dc3e40c7e013998706adcf3bc3a5f4ba19ff8146132" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bb9814645856c18759f1d0848eeb08ddfeaecb049dc760ab600c2c85ad3cb595" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3d023f6a8f3d55e1c4bfd15a828dcf6ee1ed4cc0bf26a2a1c5be025715818cc1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4009+11695745e.tar.xz"
  version "0.11.0-dev.4009+11695745e"
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
