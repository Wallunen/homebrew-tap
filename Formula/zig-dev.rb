class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3b29ba7135bb0203f4f2fbac33aacaf79ca1148f817d61ec18cfa5d0a40810e1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "47b7d8dc1ef7f2acb8a79d581127129acdf837481931670d0986108c3a0c158c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2c7e865fbe8e9566ff9226c04d9c5401307e4ba822e382f72f3857090dbc2afa" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3283+7cb3a6750.tar.xz"
  version "0.11.0-dev.3283+7cb3a6750"
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
