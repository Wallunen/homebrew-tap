class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "559553bf99f91fcb93e4d75fe1487b3cd64bbf2141e24edb5fa6d41521f85f15" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "caafb68c8191839525ee3b8a14bab0bf3272f4bdeaa26249bc3ac87ed6ca9937" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3fe5f8abb006a46b7394dbc087963bb34eb759dfc97042655895c671a060961e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2614+7b908e173.tar.xz"
  version "0.11.0-dev.2614+7b908e173"
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
