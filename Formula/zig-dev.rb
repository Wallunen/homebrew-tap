class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2c37db3204ab5e8965e245dd17ab9b144d6b7bc00245f4e638ea48f705840f6d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f7dd432649b682e19e22807169199a18964d8f12f19790434ff33567f772be29" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7059f4c0f2e3ebfe98e14416b643e0d008c649a45dc1352d3933d884eab1e33b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2753+3f5593205.tar.xz"
  version "0.12.0-dev.2753+3f5593205"
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
