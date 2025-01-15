class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3ee4d4e76fea989f00acdfcc5d9503f431b17867f46b0d5ab9de180f88b683f4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7b635a9d2d75811bdd5e299bcedd2b8619b2e4802ab1bc807c0de0d6e5fb252c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7b1c2f7326f8cd8ae4d586e62c780294cfc131c9df193fa32289837ab0d76228" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2645+affe45b31.tar.xz"
  version "0.14.0-dev.2645+affe45b31"
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
