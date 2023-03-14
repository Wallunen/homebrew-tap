class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "65d4b25baf15007a775b39efeeb12f0e85fa20ab7d39297de66fb09857e3206e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1e19021b0a8220a6264148dc3e27ec6095901927013d3a6332defb89ff3f6a42" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7f8179c3aa79914f2b7e704363a9ef87795872938a1fdf940287d200340785f8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1970+962299157.tar.xz"
  version "0.11.0-dev.1970+962299157"
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
