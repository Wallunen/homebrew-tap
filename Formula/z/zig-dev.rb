class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "669a229e8a7fd35c0b0cbdc77f839efc6bf9875b961d6c1347ea2e6421bfdc7a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "efb57eea836f86c2fcc27cea0d406b199f4b75adcb51c11429f22cb953a435e1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "46722e73ed1757f84da55dfd62370c0d198326d73b1cc12f4ac3bd0cb9e410f4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1949+fffbb511d.tar.xz"
  version "0.14.0-dev.1949+fffbb511d"
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
