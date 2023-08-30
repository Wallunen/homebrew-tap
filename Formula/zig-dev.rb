class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c052ad4e616b61e92ebc94c4d80a881eaba90c1ed4d46bed178ef719e6874642" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "35f5327ed19e3ea09b39ee399591bc8eda5fc49a9804b49a3de119d23a2b37fb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b247525c744f166e89cf88241f099dfb337a4e81b2fae5b9355f53b768b18e60" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.185+49075d205.tar.xz"
  version "0.12.0-dev.185+49075d205"
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
