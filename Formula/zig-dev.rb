class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0fa81ad70da7a83ebc91a89c40d1ba00e9111e71549af80afc5a7b83ae439f6d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "49a9146cb168f5ef8a708d9f43be206125456ff661662f841907dc5e510f3149" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6a5faf7e4fe0e6fe9c12bfb89045baf037c4a4673706a9ebe95722f9de496682" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.403+f40f81cbf.tar.xz"
  version "0.12.0-dev.403+f40f81cbf"
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
