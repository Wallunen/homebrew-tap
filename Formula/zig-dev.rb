class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f77fa504882cbd1ed9df8731e5c071b5e4d94d300f4139f53add9160bbf86b79" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "542c31d9f34a513b21b0efd86ae5a9bde326f49d132e8ce5dc24374671ec3561" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "540832e51cb51b70ee10edc42a73e1ccf9e01d98214f982bda256fd15de65f3a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1910+6d7fb8f19.tar.xz"
  version "0.11.0-dev.1910+6d7fb8f19"
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
