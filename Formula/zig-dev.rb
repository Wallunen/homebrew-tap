class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "abb841b924761dbfcd62c6cf26a4489ec4ded95eddffbe39d6f1a0a869afa18b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d19881df849df4787eec500570474e2c84cd5990b6f5557b483b259f899c1423" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2fe02e1ae91bef3be71ea1bb6f106d3a429ba9953fc90cb02f80f973da079882" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2834+30f15e3af.tar.xz"
  version "0.12.0-dev.2834+30f15e3af"
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
