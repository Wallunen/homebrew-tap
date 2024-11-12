class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fb381afc4e84f32193146648034aa136248fca91dd9dc362fcf50ca09a7a2e72" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7ccf5695b36b4706089bc3e558c0ed3b46a5da75ee707e04397d2a5fb15cc57b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5c809a1e2161709ef6059ea62e41e19ac228d1e20d61ddc4c7492b40bcde1c2e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2211+05a3ac43e.tar.xz"
  version "0.14.0-dev.2211+05a3ac43e"
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
