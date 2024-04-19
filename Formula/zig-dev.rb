class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "74a3fd03b81971cc34d9781ed9cb67a445bbe8695fb6dcbf41d33ff2e51c98d1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "41c030527b6f470315f51d9951bb0f8f06118a836b13fa63a87fe932a48f82fd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cc15c4a9b45e6882b0f61bcb1f36239ac5cc8e17d4ec70ead00798312755e720" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3677+22a97cd23.tar.xz"
  version "0.12.0-dev.3677+22a97cd23"
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
