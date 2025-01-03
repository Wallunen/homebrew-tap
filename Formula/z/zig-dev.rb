class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "322a5d26adc39f01dac65076e71c1b78d53799fdf6486148b3f13aa219d404de" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e0c10211c8b2c71bfa8d63937a95ad50d9e58c73f24db324b9299808bae824b1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d44f58a3608386587e70825cd6da69d6e458e38390787ec4dab037a0405aef3b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2597+252c20310.tar.xz"
  version "0.14.0-dev.2597+252c20310"
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
