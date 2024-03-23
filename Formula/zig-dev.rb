class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a2ba849c6958af411fe0def32c0ba306670f56f686f1b79b389f6090def27be8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "48c9dc0a8e0bc59b14eae26a085f43a3436a1b6aa66b26d619df882586606523" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "19a02d3d05edf5a5b18eec4aaddf7bb9ef3d711aebc2b39421094a6cc15aad95" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3428+d8bb139da.tar.xz"
  version "0.12.0-dev.3428+d8bb139da"
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
