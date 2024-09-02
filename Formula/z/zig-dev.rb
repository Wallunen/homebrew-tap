class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7f82dd57dc30f3091e55a51ce9a5dba18c93120aadf6e2f898e08382268532e5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "97f2a864fe290673b36c070e5c7d4868e0507d0a35bfc594adbd996f9b43f4a3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6503628ea25d9f50c5d06bc71cff6fe6d1ba9a423e9ab224595340108b72df8f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1409+6d2945f1f.tar.xz"
  version "0.14.0-dev.1409+6d2945f1f"
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
