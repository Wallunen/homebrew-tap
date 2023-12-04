class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "64898aaabe0d535303b738e17f34498d025ea6b2f9d29622359a38752d08859c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fc1d46fc81bca3ffb948ebd9b0bdb1b1c10c7bf5ca4ad25bd27b1083482683c7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bcaa8e74e832ce3b211a81dc409d888fb355051cf8b86e0c8f0bdff73d5fc7a9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1773+8a8fd47d2.tar.xz"
  version "0.12.0-dev.1773+8a8fd47d2"
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
