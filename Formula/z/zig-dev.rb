class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260808-011014"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8c8a9bdeb3c1a1d844b8c7546022707178d0a0c08fc75128996e5ca229f6593b"
    sha256 cellar: :any_skip_relocation, sequoia:      "ed6dabc9774b822e885b2a1752b5f8583f7c42ebe0f5580985c5c3be079e9bda"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f0571b08ced11f7b61d3c70cc89b6404e45eb8da194837c342ba159ef085c2b1"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1e07334a7b131618bf9a8c489bd6d31e6fb8639bf95a5a7eab7f6221ea7f37dc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "33f5b408db1c2993573ab8ee69de5b27f6aefb14d77c1fe061d5da54eab4cac9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9bde4645e8d918eaa840bfcc1c8cfa9b6567cb612f7d5fe4496244e86dee702f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1622+2b242157b.tar.xz"
  version "0.17.0-dev.1622+2b242157b"
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
