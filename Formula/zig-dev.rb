class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0306fb94624f9ad28cf3810a5e086ba03b9ea8ab97a973cbfcdd661e35a063fd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "be747728472c7b0b2b063435e03ff4a46e8751bf8a7cbdb801589e572e4b3bc4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cd4a4b9f5caed09591cb83eb77ff2c2b6ad2cdf5ee1b897bef1a9910e1fbecf8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1879+e19219fa0.tar.xz"
  version "0.12.0-dev.1879+e19219fa0"
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
