class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "997a62894601bd63a808a11280fc0acea38f5517653fe7f78a1478588cc2addd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "db9b2084fbd80c3652c8d461788f939903f302df15c7872ffca50c4307994d23" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d923cb1ace6f463e909233f3e03cd160803aa9b63548405ad1a18dd434a01492" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2362+a47aa9dd9.tar.xz"
  version "0.14.0-dev.2362+a47aa9dd9"
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
