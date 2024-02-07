class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "64268cb562d2a89c86c51f3c23d82a27690741e77fd980962a1b282b98adc5a4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "23ddbde196c4a62de96bf671306bade8454ee776f0d675cb5fc8bfd38f63a22e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fcc7d3e6b69c129d755653b3a7b4efc49fe2f7cee535dadc99999be7416977e7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2631+3069669bc.tar.xz"
  version "0.12.0-dev.2631+3069669bc"
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
