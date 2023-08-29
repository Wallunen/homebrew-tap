class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cf5967016d63156cfd25ee07a680e9ac6e3a7b209676c652fd6554a8a7517630" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "49147631a152dc7dfbba2e4f617e425f749f38fd746a3cfa23cce51a56c103fc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "98de4b3fe7080dd6151929c496d3ae5e76efc13daeb7c7d36e7a73735d3335f3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.176+c429bb5d2.tar.xz"
  version "0.12.0-dev.176+c429bb5d2"
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
