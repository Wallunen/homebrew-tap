class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6a5d8a229dbc0ffa04d4eacf3c4516165a8a368d7e0074bbcae62eefef710441" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c17d68d6e871172c287bf6763d245fd9b50128465c47ebd7d1ba0c283c8a0cac" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f9c1f314b6e64386a4156f510c541edce0e500a05736e85800744eab989a8237" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.109+b6fd34aa4.tar.xz"
  version "0.14.0-dev.109+b6fd34aa4"
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
