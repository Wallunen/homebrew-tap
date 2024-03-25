class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d4c4c64b7d683e77ad70600b15a539a4da3824da42a21c777a717b75d6fcaa4c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "276bbbb3daee33be406ad75dc5872a6f3665dec15c9229c292e299bcf46ed740" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c3fd44400daf98a23317a1a4b4cf540086b8ebd05ee4fe4c84c288e486855563" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3434+e90583f5d.tar.xz"
  version "0.12.0-dev.3434+e90583f5d"
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
