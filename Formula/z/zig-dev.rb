class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "60109bf174c8df0014d621a0d109bdfedea5020636f0868e031aa6d748995d1f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "22d0bb6a34f370647211c9142a65607a11002142b279ef5c69b5951d4d2540c8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9a603ac3effffbc44fca4cd664f480fbc92a0ceed9f7466d3707d2360fca367c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.362+9d9b5a11e.tar.xz"
  version "0.14.0-dev.362+9d9b5a11e"
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
