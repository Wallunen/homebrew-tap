class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8a04ae037c358f3b81685914243d89ce20f28e4ec89209782b26e2029e621e32" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bba2c75cf5a12e31e0311e081f0898b3edf1112ebb7add2aa8610d6184b49534" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9bcd54004b2e83d3341d4b55c827b8cdc1242020045d3b671e0d159e8e7e9ccd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.673+390c7d84b.tar.xz"
  version "0.14.0-dev.673+390c7d84b"
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
