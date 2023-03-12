class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ba69d14ea9ba181c400469d82c0a47ae631796558487766b9ac6089c7bb4bd93" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5384013a2cf4e2a4944383c3acac076e8589de73b99e7cb69341fa73b5ef01ff" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "56aec06584b703d24f4427f66dd5eaeb9561a1757929dc717441d7778d07b837" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1929+4ea2f441d.tar.xz"
  version "0.11.0-dev.1929+4ea2f441d"
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
