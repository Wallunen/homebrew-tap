class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "52cb653cde789b3a4cc9b6e90032466bda511105e41611ea5b36bdd69961dc44" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "90991aba789347e0321d36f4e848dcdd583ead05e2c2aa85f4cc54511e0d8a8a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1f3ce35b024f86d5a922741f232fab9626a04994bd1bf23f201809bc1452097c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2448+d48611ba6.tar.xz"
  version "0.14.0-dev.2448+d48611ba6"
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
