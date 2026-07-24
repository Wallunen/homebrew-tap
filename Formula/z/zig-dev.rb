class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260724-172413"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a8dd4dcb8f52c72e4d093a06c61abd1716cb3f2f4fc9d8b0195b66e4f42ca36c"
    sha256 cellar: :any_skip_relocation, sequoia:      "3915df99e592e4a9158491402c85b116df126fda35d61d764569fe37fd30148d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6f50d4ef45299c6c62a0b7243044cd3cd3508d3a69562216aede1064e0829972"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "aac27b0836d6838ba3006e1ff7476a0ecb7b567f531765e8c9c007f8d1459e47" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "898e9199baf6956da49421c72480165636e61772d1ed848f3b36dca7ecc39e55" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7ca04b891b6c8ed3713ffce82dc9defbc1fa33d0d8985be26f17f80c2dc6e5e8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1456+2b1c6633a.tar.xz"
  version "0.17.0-dev.1456+2b1c6633a"
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
