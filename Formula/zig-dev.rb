class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c84f4d6541cdb630b18f24ae297d873d8cb8db1920e2c4ef77aaf5e7e1f09e0a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "40ff127a576c7234ed7095e404920c02262cf766c6921f9e034d2d6cae8fccde" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "171f2a4deb612f61ec97f2151d6eee00687d4b64de724656353cbc2a997b77fe" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.167+dd6a9caea.tar.xz"
  version "0.12.0-dev.167+dd6a9caea"
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
