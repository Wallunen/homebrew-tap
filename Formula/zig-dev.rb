class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d4eecf7f0b15913b7d2cace9b1a328d9cf04da7cee7be3d61ae47ae137af156c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bd2c7e8f9a2dd0b63ca6b425cc0a9bf482ff66ce8c704efc73900945e7c74529" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "66e024a67da49d743c5cf9cd9467d5b64fa9e4f1fdf0bb03523bf9e355e56ef2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2191+30427ff79.tar.xz"
  version "0.11.0-dev.2191+30427ff79"
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
