class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260628-025533"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "74663381b295aab9861a4efd0ffff65826be9d0cd25fd3fc0835f1bfb7a80b54"
    sha256 cellar: :any_skip_relocation, sequoia:      "4c4b0c85ac5aa1e7da9b3001483c7ae4f9a64dbf410fc9b3f89f8518f5ee15d0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3ae171fb02b08167c55026a0812dd58484e06b9bae04809c1e29fedfe1c3f32a"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "91dc95d92b6b12627dcd56c3eb292b67c76dbc2ed90fcfabf5fae3a64036ce5c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fdea929d9e1883a2721f8cb877fb9bde200b4143a81636a91ba33934f4d2a2d8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d83be7f55772f48c14131270cb4c6058f4d61d713c45cec2af1cb2dd75472eaa" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.986+f3544a707.tar.xz"
  version "0.17.0-dev.986+f3544a707"
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
