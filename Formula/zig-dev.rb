class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "595e8219b2969573ea3fb3463db8fdfb04ed6042016ac2505e7fef44afff7fdf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f2505be7f0c34c795aaa8322325111cfb2ca4919e5a86595b1b8c75610b75499" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bc254b56eec7890abb305f934dd54bed7d8c6155b0173bbc097e0399f7e5aba7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1381+61861ef39.tar.xz"
  version "0.12.0-dev.1381+61861ef39"
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
