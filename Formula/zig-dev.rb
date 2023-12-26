class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c5412e40c4684d21a4fb4217be2dfab2c705b479bfcc9347cbec36f91e01a85a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f9a46a116f328d2f9babb4337365ca7001eb2019258cb3c9a1b521a2ab7467aa" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fc129e2e14c8cd5d3d6d8f4f7497f488bc296f801f79f0bc7c485a91c3b4c20e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1856+94c63f31f.tar.xz"
  version "0.12.0-dev.1856+94c63f31f"
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
