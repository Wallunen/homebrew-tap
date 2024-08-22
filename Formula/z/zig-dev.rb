class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2cd8deae029bfe5634492f2a4bff52ebc62ebfc2d37828333d9a78587aa27cbf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a278b6089ab0bfaacb4130eac4280b66206e80ac649ed0f345bcb36cc5bf2ec6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ff71ecf51627ab21552c53f872002077a1be68f222fb9ef1b6588e741ce46d0d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1248+7bbbbf8ff.tar.xz"
  version "0.14.0-dev.1248+7bbbbf8ff"
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
