class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cd0cdb1fb16923d765b26c47661058505b67d81d02a3487014fcaebd0cabf481" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6b67a58288481028247e49bd295b3e677f785ce48abb0cbb103b9e68a1f0eb75" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1e58e6dde8bdc127834ef752c15caf22e6279c0429b34c171027d0b85b12ddc6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1767+d23db9427.tar.xz"
  version "0.14.0-dev.1767+d23db9427"
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
