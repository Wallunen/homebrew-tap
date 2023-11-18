class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6857a7eeea53d08d306967db11a19664dd0568a27ca68d3d45f232592e730771" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "477ab9bdb2438b06de76b6d71b530aa2f24f246bbbbf6cbdaa249e68feb7959e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6654e842568e5f0bf7ecedab08359f96f6c40c60fe1ec20b3080865478ef1b2e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1643+91329ce94.tar.xz"
  version "0.12.0-dev.1643+91329ce94"
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
