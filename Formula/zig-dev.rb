class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d5c01e6329e95284e6f7a292dbc2657bcfc0bea0349604bfda137e95ffed829e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e3d379e43a4a08b42624f625d9b87cc033c199e112c0c58bc04e1401a1b1b2fb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "580b738bf42d0838a0522f6ec48560dbbc5fa7f15967641395fe188698f50f76" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.696+9a001e1f7.tar.xz"
  version "0.12.0-dev.696+9a001e1f7"
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
