class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4f00a0a12145f30aa3f5c0430722d4fcb753d2e051064fbbd0b1b0e17981ef33" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "26e615194f930c64dbf3b02ca01cf2c6f07e8ac1c274c2905af3790c7e344e8b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b1ed8e3ce2fb277efdfac2330601467d63e67782e8f6cf467977adf738d9c92a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4002+7dd1cf26f.tar.xz"
  version "0.11.0-dev.4002+7dd1cf26f"
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
