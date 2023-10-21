class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "08a69eb878d8305e8438f64ff4ad40803e73afbaa65144cdf1162cdab92ce6ca" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4c1382cd3607c40fcbe3888af8da325313fd6cb14bfa8f146617362c37db2a5f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "361aaee4bd9bd11e976860d8fe13f9425ade3f957d88fe7d075de01a3cb0f2c4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1137+fbbccc9d5.tar.xz"
  version "0.12.0-dev.1137+fbbccc9d5"
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
