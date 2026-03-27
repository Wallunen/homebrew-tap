class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-31983a02"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "989e36e8562ab2557d0b52c2b0fc24abc01b8bdbb2e4eb5db01d536d0ed47690"
    sha256 cellar: :any_skip_relocation, sequoia:      "9bbed627ec786d956a0f7ce00f5d318b576a3a97daf1640b83019a7f40e2878c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "81a215273b68adc8361cb394ad2a0cf8678a3b92dc51a766fffde5b899c2a1bc"
  end
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2da90e83e86de0c95da850abb14c49004d8bcd91381305288dafaffc7fa3eb28" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "98c900fc8caef728e6cdfee4fcabfd5e275cd92dd24cc6205b59dca5043a3066" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6c1e74a95157d0b5790b976e2ac47eedb94ba90f1c59f9ed77d81fe2661f36f1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.2984+cb7d2b056.tar.xz"
  version "0.16.0-dev.2984+cb7d2b056"
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
