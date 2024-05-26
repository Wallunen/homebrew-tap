class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d77d5145a9c60a68dc88828496c1bed363beaa1154bd4ee187e425d59a9ec12b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5d17f7bedd108ba0e2d80b74b7ecf5e08631841c0a533e2b8983a32dabf86cd8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d3b88f563df0bc0283956543e7de6cac07dc8eacac6b38c4866eca047e27a155" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.266+0b0625ccf.tar.xz"
  version "0.13.0-dev.266+0b0625ccf"
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
