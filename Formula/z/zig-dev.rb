class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a901e082da8bb543637369629d08cea64b0dcadad3a10a5780c9fc5afe9e8ac0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dd035df064b38648aa798b97bdf834f31ee913f14c160aa67ba8a457770f5898" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "080186a5f0fd8f54153b51bc72800793622c8ec8b2bcf5cad66df6da2ade87b5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1651+ffd071f55.tar.xz"
  version "0.14.0-dev.1651+ffd071f55"
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
