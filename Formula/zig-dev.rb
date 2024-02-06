class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e2561878eff8c5a269911e1ea6e3fea83bc32e7f9a5688ab5dc26f6c2d662798" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "debcd87e3d67d5b4c1a65b31ce058d37e6101f09f04492a2df130d65755be09b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ad85617295f5088cec55fe2f24978cc7f27af421a2e527f077e0d8f264c89838" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2589+eaa6218f0.tar.xz"
  version "0.12.0-dev.2589+eaa6218f0"
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
