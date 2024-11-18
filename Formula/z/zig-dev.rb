class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5e9d7983566c50dd484e88ff64fbad3879c7f4f3818778624ecd78b40277a721" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1a74bbf0d8a3a1ae52382d5fa32197b4557e3242dab01d263c1ab5183a365bfe" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "93f27a635f5ed0918bea3140bdefb24a3096c5e3a900827d8f96a8243b4549e2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2252+7266d4497.tar.xz"
  version "0.14.0-dev.2252+7266d4497"
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
