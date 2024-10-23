class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b14160785ce7b6ad108be4923503af2e3d97cd082053258d206482088bfdabc1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bb71559a333e9f6051b09dc2ebf76eb24868fb3afc22030a1db9ed9af98d405c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7979c6e12e92abe921c6dfeedbab1e15b5d8c07398d36505bf61804fccd2f059" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1954+2d888a8e6.tar.xz"
  version "0.14.0-dev.1954+2d888a8e6"
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
