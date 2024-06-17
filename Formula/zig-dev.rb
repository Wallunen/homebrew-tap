class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c58393c5e0d44ddbe976a7392660a3ff597062f2177c99353d26aba3580a7703" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9a99e129a04725646d4c8a0b533d015aa565b727587010604d4babbd99eb5625" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6bb51b90b8b60931bc84e3a0cd05958c9b173739e9ecff078fa2dc9f7b3f6d15" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.43+96501d338.tar.xz"
  version "0.14.0-dev.43+96501d338"
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
