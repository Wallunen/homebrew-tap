class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a4765f8c53bbf9aee3a37c27e62fd3d1d86158bdfd6a8eeaa72ccc4c40f01c6d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "64d3ce01da586ac0c303199af56cc950072d871e22955442c6405aa569421147" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4010897a05e0c0ba26ef389b944ab55c22c1c43f7726061b441bd5ce9d317f49" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.978+78855bd21.tar.xz"
  version "0.12.0-dev.978+78855bd21"
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
