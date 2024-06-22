class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b16515a5458aa43a3c7a40cd1ac8cf93ae8364aa995115b5529749beafb5fb5d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "39e8744c9ce60b33a41246af92c88ad86efbe30d527b78963599ea0ef3fa2507" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "90e35ffbdafc4531825b35328dd6b225eb9e896be76e21989a818650c1c0de98" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.111+451550e86.tar.xz"
  version "0.14.0-dev.111+451550e86"
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
