class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "93681cdb000f1f0c9bbe1f581d4faec9a39abc0323f9d63333f46da648d3d55b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5cff00fdf938462658f1b00296f03ebea97fdd1619519fa397582e5de7a5b46d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e64b7a386ebbc805d67a8beb0af70250b33de737700020ec1cac6de27f947ae1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.890+8c6b0271c.tar.xz"
  version "0.12.0-dev.890+8c6b0271c"
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
