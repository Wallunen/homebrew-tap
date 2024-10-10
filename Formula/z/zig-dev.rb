class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "50eef595ddc73613b21f351eb60e0ae317d7a32362ea305f56644c752a6f38eb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fa6bfd45a171d9abce0018cad9ef0e9ef6a5de731ebbce871538141a40990639" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5123244dc03ae5e937d517c0c0368187a59607790cdd8f0abde89ae2d4051f18" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1831+ce5a5c361.tar.xz"
  version "0.14.0-dev.1831+ce5a5c361"
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
