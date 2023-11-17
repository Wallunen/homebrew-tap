class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "55f5343b7af2c2dd7166d8d799f81327107fe34429f57b9f4fc489f74fb91937" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1151c2bf338f91dbd6fcf4f3455daf227c8d322d7aea1ac356a62c8ef5d5bba8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f0eb26dede6d8419a1bd29e099d943d4584cbc37f48d35dc95eb75d49760139b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1632+acf9de376.tar.xz"
  version "0.12.0-dev.1632+acf9de376"
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
