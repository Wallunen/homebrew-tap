class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1271a9fb3a2e0e83d4623183a1babb17035980ff514e583caef1f9440f0cb080" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d35cc869f82aa6d02e59aa9b1952be8d59715aa623bbc704581187979ad35f85" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "64d73dbc4a362cb5a82b38308e646d7b3cacc4995e6be67c6df38ca77b127559" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2563+af5e73172.tar.xz"
  version "0.14.0-dev.2563+af5e73172"
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
