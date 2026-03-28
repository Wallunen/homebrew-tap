class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-78f1e7dc"
    rebuild 3
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e796f412e56195c41e62bef5f6a91dfa0ad7ab431315593b250195897868f709"
    sha256 cellar: :any_skip_relocation, sequoia:      "3b4f76ae37681cd63191238262328f6567f0116af2502293a0ffe84ee5cc400d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "45c8c7b5963ef78aae26b5f26786c2799f2efa9d505046b00af8291c2dc207af"
  end
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1f977d5a52c0e152888edf0e54ad5ad922f9020e18fb0b4898c226970a830522" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9157bdb6173be091e568f58daca4c848db6c0d54fec6d3127732a058f761ac0b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c05b0d63c4a2caf927a8f2c4600a2c602d2e6cf9b152de40e031060e8c25283f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3006+94355f192.tar.xz"
  version "0.16.0-dev.3006+94355f192"
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
