class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2aa03465065a649472f999bacbc41c97fb1823abc2cd202f080292a756e1f9eb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a1d06af736ac1932f713f56a155e62c6ef71950cb7cc92d6f507d8784251a38f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "075bd7d6d98999a37316f4e05e42ea996577d3cbdbe12f434e70441397d6c839" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1660+444228865.tar.xz"
  version "0.14.0-dev.1660+444228865"
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
