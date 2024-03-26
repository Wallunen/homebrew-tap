class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "278712a14d5df6c9a8d5dfa12f967a414781011369eefe1c8364b9bed5a5916f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "06717fd44a3ebe627dcd49c239bff62c279ed1350cc94ef92a22acf220103a2d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1911ec6e62eaa1a17312a2947d4c3d18fe0eefedc8e0f9fc552172355a505f89" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3439+31a7f22b8.tar.xz"
  version "0.12.0-dev.3439+31a7f22b8"
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
