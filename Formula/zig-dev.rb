class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1513a3fb974d270eb11e36f097c4bdcdb1e9ec56ad759f51dd965d8394f06443" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "36287769acf683f7548e9b39df52a41befb5060ffdfbd90ea4b2640df677a5cd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0d4c5f8be46fbfeb67d904caec4b0a0df75a4a5a58af643f4e1bf2455317f972" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.21+ac95cfe44.tar.xz"
  version "0.12.0-dev.21+ac95cfe44"
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
