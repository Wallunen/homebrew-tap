class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a5bb2b89eb0e31bc0d8e168a419202d8e0c12519157fb2a9116f8dfa8e92db87" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0fe31cd7dcc2b79b41c2b891058c33864467ff8b05802e9581c1a77acee0989b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "40a6f08f61e445a572b614fc0117877f10183ce9fe58cbeb80b5353373ef2ae1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.866+3a47bc715.tar.xz"
  version "0.12.0-dev.866+3a47bc715"
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
