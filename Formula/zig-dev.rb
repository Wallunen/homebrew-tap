class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "18ff191f2dc2e57d32d87ec1edb2adff4551c9dc4afde65370f51d2d0b9dda87" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2e80d75bc109063166176af30b5ac0c657aa2de501a0e56ea4f8eb59a5ff7cb9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "77d37d879ce6d03ec99b03f5ddd752277ca5e80c30e6fb3dd3d0094fcbc18598" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.47+0461a64a9.tar.xz"
  version "0.12.0-dev.47+0461a64a9"
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
