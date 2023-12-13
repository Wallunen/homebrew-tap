class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8c788d737c75a7ba89ca99af8acbd33aa716924c3e2ab8c3dd894f0295c39c4d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3078248d174db40bdf74e369c913c4e35a8d2915f8821a93621934a9f8061e30" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "503830e2981a1c7feed44c00eab3e308ca72b3c2409704467ea32ac1c5e4f845" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1821+a38af5f54.tar.xz"
  version "0.12.0-dev.1821+a38af5f54"
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
