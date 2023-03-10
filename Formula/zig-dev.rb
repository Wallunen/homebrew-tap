class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "10535f33e2a62a96c563a4a58e027a1a733943bbcba5960e561e42028fb318a8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4c00e631adc16f180473907f06adaa339f44d2f17689a6e54149db8bc1bbf628" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b261be53397bee5c459f84111c59046e1924c7f8357b98e025721cc1cb57fc51" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1912+12b74b2c0.tar.xz"
  version "0.11.0-dev.1912+12b74b2c0"
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
