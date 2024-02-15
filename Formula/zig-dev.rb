class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e3ee2b56dfb554b9c16c0ea9f7ffa2ced0e202cb50106894ad3064eedea06396" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f65a6aa1afc7cf6ec4e8b9f94394a9ee77355272b012e4efa51d8a0c889cd2a5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cb0e34e78bbb27c27a519b360c6d4141f7dd5c4d9b5e444154d10c81c50ee6df" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2750+5f9255829.tar.xz"
  version "0.12.0-dev.2750+5f9255829"
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
