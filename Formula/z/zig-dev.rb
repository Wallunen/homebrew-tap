class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8fa461b01c3e7c93efc5970757e9f986ce3ece075dba8f39a39a97a868f5bc92" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b01f42a710a4024ddce998b681adbfe9120b7eda4da7af8f6ce802fab09b2d7c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bd4898bb13a146de0c75f87e7e438624675c8f3fbe8ca3baca5cb841212bf669" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.302+d404d8a36.tar.xz"
  version "0.14.0-dev.302+d404d8a36"
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
