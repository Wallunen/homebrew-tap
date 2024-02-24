class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fe2799d03a63c4c08e9ec452cee255b2ddcfb9b320133f171054192d7ea2df18" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6bbfb63d1c7e65964d36d4e91d62ded3fd4bf4f22065be01c7b196bcdfadb9fd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "93480af6b3cf2a2558c9c8ffb10edfb2fb1205e73875f2f40101bd6f17cf7360" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2858+7230b68b3.tar.xz"
  version "0.12.0-dev.2858+7230b68b3"
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
