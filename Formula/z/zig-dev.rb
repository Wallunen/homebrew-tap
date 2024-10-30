class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8e58d2bfc3d4d596ab58c9cac43feb4d052782b8a6c3c546116ff08d122abdbd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "de6e6a3ef7f6b1f2a1f5ab1aa09b404c3b9d97efcc78c254650172c12bc07895" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1cb630ba37432ce7166c151993426d96fa41ece9df4511b8a14910d04803aa34" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2074+3450809e3.tar.xz"
  version "0.14.0-dev.2074+3450809e3"
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
