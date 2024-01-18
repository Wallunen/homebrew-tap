class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "654937e2db78e05b8a1b56541ec9dede0a448c4f8747c9729fe7131ae9efc1c3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "eaa124725cf8228173de19ac807a9b4500a338937b2b9ccf4161d1e4cec53ad8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3d0af6667d950adf9c1b9ad12ea0c9e1005425771dd9e5bbc1dbd7d4693c879a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2269+ec358d6db.tar.xz"
  version "0.12.0-dev.2269+ec358d6db"
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
