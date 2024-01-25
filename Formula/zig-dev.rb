class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1ece29c81cc388ebc213c8e20f564127f5d8077d2d1a97404a141a6a49fcf8ad" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "77a948acb0048c57b66ef791039b09ea2f55663543bb7cef4b04c0b22a3696e6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8145e518decedc2e1dfe9f55d547e4103b0dd68a2f24527c4da9f8b31b3deaba" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2341+92211135f.tar.xz"
  version "0.12.0-dev.2341+92211135f"
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
