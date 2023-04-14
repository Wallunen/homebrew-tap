class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "08cae09f7364e07bf07460144adc11cf9933e254e51262611952628e28f28dd7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "388e2166154d1df1cc3393e527d27970b425b00981100d6ff90b09234e83730b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a17fac2ed33defbca457249fc9a0e10a8d958890572acca0d8e0aa16c90918e5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2609+5e19250a1.tar.xz"
  version "0.11.0-dev.2609+5e19250a1"
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
