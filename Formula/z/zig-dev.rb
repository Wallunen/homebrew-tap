class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cf50908aef16052d8a9ebcd481f3d7afdb71652e05ae948adc49a192ccb08960" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "860b224a1d710803cb45a69f146c4e35905b1143bfa28de7b3bb2dd9f0d7e501" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "24fffa71beef2d1a1b12eb76b02a5524a4a1139fa1f65b492efb254e0059729c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1573+4d81e8ee9.tar.xz"
  version "0.14.0-dev.1573+4d81e8ee9"
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
