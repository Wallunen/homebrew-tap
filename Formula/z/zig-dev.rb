class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9cd39273fd33a6730650bd5524460ede8ddb32cbe93196839d851246ac6b459f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "38be489eafe8774374fd461a1a95b8db70aeec1ec1cdca11bdbb710173eae269" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c5eb04b0b9c6a44287ba1b65d2c6013ff9c0c6eaadaa168a1126e69b6e87c839" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2497+8f330ab70.tar.xz"
  version "0.14.0-dev.2497+8f330ab70"
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
