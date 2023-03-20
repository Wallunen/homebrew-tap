class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6799d86bf851ae3e4a3bce2e877ae0102519bd132971ea6fdfade5372b78bfd3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7dcc3e8a361aad184aff1942387a0ce7be94a89f66bfe189b0e0b99d3ba967dc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5dc948c36c191198742a2a4190d73140cafcb0e2c415a813703a544f2313dbc4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2168+322ace70f.tar.xz"
  version "0.11.0-dev.2168+322ace70f"
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
