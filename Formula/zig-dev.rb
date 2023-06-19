class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a31be282718970cd10bfa8123fa88af09158495aeb61e5ec646eee34e11ad6f0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7a391204428e45aac5ff3eff1a9c1a8a70a75b2f4477dc579ab0efde0fd72ca0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "aaaeb10b652b6eb73661ff279ff510f67844a52c272e0759efc73454704177d1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3696+8d0a8c285.tar.xz"
  version "0.11.0-dev.3696+8d0a8c285"
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
