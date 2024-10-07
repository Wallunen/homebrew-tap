class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c6773f50354b8663f71a21a8f9186c3c8b273ba49381858df3cc972c99dc19f8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "03681124ed41ce7f0a10f2848e5532994e887b8f6451d7e737611ea7bebf2d33" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "602991d8f06b4384dfb0bba493809ba4e48c40e4b97d2c4bf7f26f4fa851b553" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1798+148b5b4c7.tar.xz"
  version "0.14.0-dev.1798+148b5b4c7"
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
