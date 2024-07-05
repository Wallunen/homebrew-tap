class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "36ce85ebe626b0c6f5c800ac6e4ef0c53b6784243179a3fd117d4eae46ae16fc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dc86c410698d13003c2d680379c3706dcbe3283a133fdc237ff5ff79a086c9f4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bd79a35c81a87a9da58fab9700eedfa5620a9eea76271a899da1c15324d5e77f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.156+d9f1a952b.tar.xz"
  version "0.14.0-dev.156+d9f1a952b"
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
