class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3120f60af7c5c31ba403cf410f7a514179d109cb6094330b5c1bb339f28e9cb0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6a38201d0be710dcbd3e71f81a89cc1dfd17038ef31dc2829cc0447d13207d11" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "eee2a7a0553178fa584d3fffb0c7b5e535aa2d7e5cd53f4158937f8381ed9dd2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2312+2e7d28dd0.tar.xz"
  version "0.12.0-dev.2312+2e7d28dd0"
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
