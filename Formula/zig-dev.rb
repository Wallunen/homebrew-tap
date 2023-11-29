class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "abec1fffe032c8a3469a3aba93019989df02d28db6d6e9d851b95d78dcdb3d14" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4fe9a546a92c3f10dcfb83dd1043e2ef03f8f765f6b98ee8cfe98a212831ec57" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "67e192d2a800af2b48c82ccc11efdc27da4223d555ad22852e1bf3792a0444b3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1754+2a3226453.tar.xz"
  version "0.12.0-dev.1754+2a3226453"
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
