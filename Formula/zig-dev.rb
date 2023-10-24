class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "73703f0586bd10a59c302d4fa6194004254a6ed548ee16ca2a4e6eefee550dc6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "eae050b3bd572ce685d05ce01aab74d0cbf6c974d020b229b8a6627e13354c90" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2272cb91131fd27b93c754cf1cd977dd14fed3bdb768786041059dedd5775d4e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1222+6f0198cad.tar.xz"
  version "0.12.0-dev.1222+6f0198cad"
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
