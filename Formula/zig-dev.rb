class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7c097dc24a850625f015467ff8d1bb4ed513f7e84fb97edce6a03bdf6ef98767" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d8f303bbdd7e1db79a4b0f254cae0159292bfae42118cb98fe0fc1b1b3780672" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "985f65b44883c0c9f1b6c11e0e8dd012db51e8cdf14f51d866299363ad5d5aae" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.363+7fc3fb955.tar.xz"
  version "0.13.0-dev.363+7fc3fb955"
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
