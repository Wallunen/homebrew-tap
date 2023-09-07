class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b6049953c0ac5b8dd6f7bf1fb7dcaecc5339c6327ba528dd39c8b8c7748248b3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "96d818034cdc4d57e5dd75c522c465f41819bb12e75bb13009050ffc3dfef0ad" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "90c024654fb6e17342782e39071de1074b4afbdc9115ac401a6e5405e3131635" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.286+b0d9bb0bb.tar.xz"
  version "0.12.0-dev.286+b0d9bb0bb"
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
