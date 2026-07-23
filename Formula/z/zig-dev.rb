class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260723-021240"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a4e0e7e801d156e2ba38411d09e5a0011f5f07f7787b21f740c85e75efc4eb35"
    sha256 cellar: :any_skip_relocation, sequoia:      "875b9af02e9ff40726162f5ae2604133f2f1023763d3482feea33b9552d8c9f4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bdf0cc4b3b17c1e7977666fbe67f17c340998113a604d3363713a1a6ec1873e2"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7b2899e55265abf3831fdee9a464cbf915e4c050a8e9181a683a3934a8af151d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f38864d780367664426d8ba3b87dab2005d9ca1add5558a321d62118ba87b96b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "555b89287be3f187f38a6a9727801986c51402def38a89f44a6cf404dbe7837c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1454+5faa79730.tar.xz"
  version "0.17.0-dev.1454+5faa79730"
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
