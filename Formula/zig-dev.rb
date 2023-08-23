class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "78e8e680e6a4a3be47acf0d7a5c90d45c80d24b4a92edd44cfddf6f2afc007dd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3fc0a13ea0a98cf77aed719ff3833df1d71f37e3c887785e600b21bee5a099f5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d7691e5cdf8e96289094f225c16b0e481d87f20094f324d4670f90de11a1198f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.163+6780a6bbf.tar.xz"
  version "0.12.0-dev.163+6780a6bbf"
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
