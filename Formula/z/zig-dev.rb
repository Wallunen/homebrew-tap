class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261003-032611"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2228f88e626ce78c4afa74a332b3556d74212afd6ca1292e35d3737da349378b"
    sha256 cellar: :any_skip_relocation, sequoia:      "05b53b9ddf29f2a0ddfbd741420cf2cfc9cd3ad5e1c0c599b2a010771a8f41c9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dfeacdfa39b7bcb5684999831734f5fbde88e301fffa68af62d4303c66aa455f"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "09d2af1b44d6d169559cedc21210ecdf45a1bc7b69600de12d33633c5d7ddf8a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e31cca4f907f97673e733c8d457c2c9709953b44c372d16e9f6b66d4629500f6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a31532218e7aacb53fec6d25d0f5ea05de4ffb083fe2bceed0e64aaeabb6f786" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.18.0-dev.1+a6c6412a8.tar.xz"
  version "0.18.0-dev.1+a6c6412a8"
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
