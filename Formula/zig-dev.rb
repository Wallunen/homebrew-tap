class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "597804c5a555858a1f582cd6eed865673e67cbcdc0a71569f1d7b11ae68aa000" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9fcb452f1c31f64807b76b6d4ed17ed63357918918562d3526897955f70a751e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7494daf11826d95291da91c9ce7851af5ac2c5ec21461f1a2f6a0e258960df8d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3913+116a99d3c.tar.xz"
  version "0.11.0-dev.3913+116a99d3c"
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
