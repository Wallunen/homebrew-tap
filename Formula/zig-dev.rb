class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a82a681dda39ef4a7f37c0985cc83917992532d9ad9a034868f851d45869208f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e185bc471582198372daf302f8b4c10a2d36cf2e11912952046faecc5ab3cf9c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f5d32a24e70961f13d944bf42452f13c398450f1afd16a3a2ed805e2758f8bce" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.339+6b020c3d1.tar.xz"
  version "0.13.0-dev.339+6b020c3d1"
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
