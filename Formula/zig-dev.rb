class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "24325083db896adbaae9c3232dc3449aed2ebc9f11e2876d57d08c56d6c29873" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "85fbb8a8fd3d0b66c0e87547365c561af5b7eaa5a030a4fd9a65fb31739c2f1d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7d03b6ed2a695ae2e7771f17613a399cd5ce4f6c99d3c1db1ad523bac3e15369" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2285+b80cad248.tar.xz"
  version "0.12.0-dev.2285+b80cad248"
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
