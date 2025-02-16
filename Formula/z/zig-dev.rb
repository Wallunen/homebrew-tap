class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "82f869c7a7b518b20d37dac7c8d2321232865699cb351427fa8d0fdf6eccb01b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a7c684b5d68fbf56345e83bfeb4f588ff61992abcb8db78b8a05038204c036ab" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "80667941010ee58b4102d19df35dc5c917d4bdf06ccf91a72b67d8b47fb90bb8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3224+5ab511307.tar.xz"
  version "0.14.0-dev.3224+5ab511307"
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
