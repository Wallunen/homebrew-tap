class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1d57e1492cf8b86f51fb7aef9c8f522f4dd244829996a6173d163c462ff1196a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "65ef5f2c54eea5806e0fb68fb72d88f798b743125a15c650ddb793dcac11d141" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "70599d62b413826a7f3e246118d37f04e1c22721803867e344e9e102187d409c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1002+71a27ebd8.tar.xz"
  version "0.14.0-dev.1002+71a27ebd8"
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
