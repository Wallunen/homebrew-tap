class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "91e1f96b315690242521aad2554f39460a8d8bc129f85364e866159e5cb2141d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b987cf02a9654f898a288113f65926d0bde060b24d9f6d0d50eb8ba87d44878d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9b9410863720b7a60b39c21f52f70883b5a9251879180818dac8f982922c60a6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1827+e1e151df0.tar.xz"
  version "0.14.0-dev.1827+e1e151df0"
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
