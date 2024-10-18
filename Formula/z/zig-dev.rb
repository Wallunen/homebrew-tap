class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2b9d635023c22fede5c813d95f2f4d4880d2117227dc1b74f8f6b63f14cb3fb3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8fb48b29d185547cc51402c32295db951b28c682d10dbad009e0c46079cccfc6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5377e0cdf90eb2ff365ffbcde69f8dd899451192eed05614b2bfcca3e9b13843" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1939+816dfca0b.tar.xz"
  version "0.14.0-dev.1939+816dfca0b"
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
