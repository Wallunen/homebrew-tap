class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a1b72e6bb3506c9c8c2e42648bf161a4b23e9d91c34fc7ee7ebfdf49a10683ec" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3d0eca0752336e655a09144b2b14f451cbd82e869b644c7e9832c412af6bcae8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "37fee3459cfe6402be94a8a21e3a43d899c7d19c300f03e9bf3a9a0bfda0b2e7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1457+7e3180487.tar.xz"
  version "0.14.0-dev.1457+7e3180487"
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
