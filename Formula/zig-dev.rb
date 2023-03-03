class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0650b03842e4e73a22ac09dcdf420714d888674e7a2326fc02766f8783ca766e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "17a5b5a1421ddac6447e450c0aa975de90490be90c87f2f922d721091055cc8b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ca993759a6b78e6f74888cc48a335ba230ddb7aa94cb2328cdef57b613f15e3f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1836+28364166e.tar.xz"
  version "0.11.0-dev.1836+28364166e"
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
