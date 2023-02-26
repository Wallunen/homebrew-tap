class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1e1966aea14c1ebf0ea7cfb4db21c1a73003c670e78122b599c804ced7e397e4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "87e54951c85f1ac00b36ffd0cc5d785a63b7869c8cc1cea8ae2b1950b074c6a5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6195921d7b9f1805462c950662043c2689910420821a0283979517dceb4340d2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1815+81a47dc87.tar.xz"
  version "0.11.0-dev.1815+81a47dc87"
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
