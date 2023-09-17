class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "facf4535b87950852611c6877a66126f0b66a029f791b0612410d0b71c6bcb9b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "abe94ffba1b9352451a0b39f8d1e8c02a043f9135a5df63e9afe3d2816061cbf" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "08d1d7651f995ac156d1dfb21589ebfafcd87f5bc731cfbe6c9970aa25fb7305" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.394+f2026e7dd.tar.xz"
  version "0.12.0-dev.394+f2026e7dd"
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
