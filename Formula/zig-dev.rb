class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bd609d3c40a203ecc69eb1d3961de6903726d67960a04807d7261cd6d3be0b6c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "082824ba9b6951ea030039767d0c7c9305eab29b1e7530639ed24835af8a5f01" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b2addd0f74c0103c7e1098b24c78255dad9f4cab81b121d0cc4210e55fe855ed" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2990+31763d28c.tar.xz"
  version "0.12.0-dev.2990+31763d28c"
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
