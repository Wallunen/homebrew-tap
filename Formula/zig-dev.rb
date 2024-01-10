class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "52de72a56edbab11d1018206eb26cf25d26117fc7597e507cab7f10c71c25245" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "44e3c884a6896963821c04b338dd9c4ee6c38274d6d0a1c970de531ce0d982a7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "317bac2e0f798774fe8afaca25dcb0787e7130741e41a02771ce039277f5949d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2100+8c9efc95a.tar.xz"
  version "0.12.0-dev.2100+8c9efc95a"
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
