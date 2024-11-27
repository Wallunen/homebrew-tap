class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0bd72e921729f54f871ea12555abda9ee5b1f592c4767794e693923d8eb48b56" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c666f2c82168bb14d5064e2f9cacd9297f8b0bf7b9661cc987f7dcaa4d83dd08" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c969f17ea29bcda19b74574071f94fb96486d274470a95bb5b2e6495524057ae" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2310+b0dcce93f.tar.xz"
  version "0.14.0-dev.2310+b0dcce93f"
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
