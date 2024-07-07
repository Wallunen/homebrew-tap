class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d177f9b1f473f24e433e7827a6d2d99c1c9ee2b3cb667d8fbfcd24b0d191105d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4b699d24630cfba25975dbdc2149fab1b52f0605cc02a078e80eaa04bf2b8c4c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8fb0430fbf95739505df80a65509a16788c6892a419618bf4a2b2808ddb71cd7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.185+c40708a2c.tar.xz"
  version "0.14.0-dev.185+c40708a2c"
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
