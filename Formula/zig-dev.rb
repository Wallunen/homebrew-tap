class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7c9e47750aa0122423f6cac14b326f337d951e45e08451014bbc2ced038bbeb0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a9b41774677d568687359694877bb3a447703507f1d45ca382caa581f6e3cba5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fa70959d95b99523dc3554c29c2cc552315cabb07f21117cd88761fd64920306" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1626+0c6cb8d8c.tar.xz"
  version "0.12.0-dev.1626+0c6cb8d8c"
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
