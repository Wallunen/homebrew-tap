class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0371b5f7cbee48837c8c6c02ba00a3b364cbd826b59e0bc1a2f1ebb9eb47783d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1d910de4f774adb3e7912e4b722a7ad3d983cd244b37d47a48ec4b66165214e7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d1971d7a5f6f5ec76881dbd8661fc682912b25d56c84cb571abf0bb71996b572" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.310+5b7eefce4.tar.xz"
  version "0.12.0-dev.310+5b7eefce4"
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
