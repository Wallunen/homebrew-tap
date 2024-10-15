class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "93155566c98708f213632e51462d11c8abc66502e59f84a570f31ad6619cddbb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bd9e120ed0ad795861341899c16e1c3d3feb4cd5b79f464abb50bc654dcdccde" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1c567e5606c0213c970a0e7521f39b243e65a4d611996b0b08b3f910c00068eb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1913+7b8fc18c6.tar.xz"
  version "0.14.0-dev.1913+7b8fc18c6"
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
