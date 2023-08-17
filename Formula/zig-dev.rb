class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e0a60f42334f2e09493999e71f9698b658304b17474f6dd74f00538cb9bb0a98" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cfd4ae60d78553cfbfaa4ac555aa55a2e2c758d2d07af2b2dc143a17ca424659" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "be05df466680d1975873c28e26e6d5edd5ac8ffa55cc8e9f0d414a253b31379d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.105+f1992a39a.tar.xz"
  version "0.12.0-dev.105+f1992a39a"
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
