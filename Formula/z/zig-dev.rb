class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "71c65111dd9d6ac193dbb34994a226a1a65f7b5c5a340d4c26e0e1deab216da1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f952c78811183e3c455116c8a9fa44efbbd67d77e8021e6f72e62d2e9b586808" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2f25d9c491fe14d00f73b65ca43df344e513871d06e9fb8e713aa22404ec13c6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1773+516cb5a5e.tar.xz"
  version "0.14.0-dev.1773+516cb5a5e"
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
