class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5bd005726c1bcd7570880e9bdad5fdc51508daa0c3cb7c8b808ee769f14002e2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3c845005f1822d391df25cfd0eba7eda3e5e70dc79070ef4ece44d7a01407d21" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "60679aeb80a45f5d5e9b58682df6292d3d108fe51b84f8a4f7c12a70898640ee" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3395+1e7dcaa3a.tar.xz"
  version "0.11.0-dev.3395+1e7dcaa3a"
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
