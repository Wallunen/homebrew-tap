class ZigDev < Formula
  os = "macos"

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8d9b7a6aacbbc08bc05e913fdae7f37b7dfe09fa600861372b5364b8a2c148f7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cc50337824c49d44a869ab88430385d79d1e40607ec292f7ba00f05425aa7f06" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0d15df9bc74ca7309707d5e195e672a4ec24d2429e2ecf007c1c0e2c7fd84902" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3039+b490412cd.tar.xz"
  version "0.16.0-dev.3039+b490412cd"
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
