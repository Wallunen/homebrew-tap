class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "acb41dcd885c6f7fc5cf6126509ce3aee347354b4249096a1fa8c82197d5789e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "63182ec83b73a38d8851f810a3bccb55336461b9a99757d2947aa6f7d0a5b89d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d2a47809d6a1ade0c0cbf3eefd7b43e629e36d13f3de26f7fed5a1efd25eb71d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2208+4debd4338.tar.xz"
  version "0.12.0-dev.2208+4debd4338"
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
