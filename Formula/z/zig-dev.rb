class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5062a228fdab5ef7b6643fbd241a4e42dff79825588df80b58a7652896fa268d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9f0924dc0a7abbd7fba4828f233cbf8cd9bf2dcf356204a0b2fedbfeb78bd475" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "397f758eb7db7d62d0a33e54ec0c2eca964de27e483fa3505ca93c86e1e6bd7e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1349+6a21875dd.tar.xz"
  version "0.14.0-dev.1349+6a21875dd"
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
