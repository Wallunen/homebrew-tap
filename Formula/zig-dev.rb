class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5af2e831c74ebaec884531c8ada1307900faa2889bf6819c4ed28243881e1b3c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2ae1dde738106129696fc5368761700af8387773ef4f36d35bb4b401af5f58e0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bde7fee49c7faed1ebd51c47a6d946b61ce5b9467b2bd9d09d1063ce187613b6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1839+bb5006d72.tar.xz"
  version "0.11.0-dev.1839+bb5006d72"
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
