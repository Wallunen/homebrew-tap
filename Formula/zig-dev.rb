class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c28918e10d6753afe009b1de5e71f40c2d3840a0f0878f38713afb4cf28b13d8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "675f440d72d8a0b35f3cbd2f54066e67b1e02193e5165d47c1d5a610d935c704" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ea7d889f90330404de73723efd06effa190efcc164323c8840b2bb4872c47127" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2725+4374ce51b.tar.xz"
  version "0.11.0-dev.2725+4374ce51b"
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
