class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c87c30c720ad2d235cdb6d3a29ae3eac3fe94d2daafebc38a3c931e477a996fc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c96a6f9cc4fc4600a71e2f5892b506ce36ed3514c228ba484f4a0e06072f0939" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e004593a886222361825bbfbd6037334eec23fc1613b14f2e2621f33080eaea3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2297+28d6dd75a.tar.xz"
  version "0.11.0-dev.2297+28d6dd75a"
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
