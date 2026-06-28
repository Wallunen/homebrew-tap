class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260627-024055"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5722108691f4df654b503fb4d6bdb48cf9723b97e50d3a450ce09acad65bdffc"
    sha256 cellar: :any_skip_relocation, sequoia:      "9eb18567ae852f7018c21f2b545b1c2e1bd9f7025bb08e96d58006d6e34ccb6a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "865a5262cedd9cc3cedd346cc06d62a7c8271afc58157408128ac49c0043f4d3"
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
