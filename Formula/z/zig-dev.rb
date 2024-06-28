class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e9983b02f43bb77d4285d9d013b611afb1bc46366f60dd040260b5e9e654cb50" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3a6d774959441c7c4092d734633ae6457cc29288529d3b2ad94de6c6fed3d2d1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5f0060378e537d31df1673bb4f97f489e79371f5d3cc283cb353751f3839bc1f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.130+cb308ba3a.tar.xz"
  version "0.14.0-dev.130+cb308ba3a"
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
