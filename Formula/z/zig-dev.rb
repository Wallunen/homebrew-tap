class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c13103ac44cea736073d235f4258d8298b8d685408dd5c2188cf9c05bcfefa6a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "17dd57959b2cc961b9189a25be50718d6a0d4f7394ceac1aa7c427d6400dfaea" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d228c3627981668f2bd9b818c878166913950d48addb403cdc2cfdd0149767fd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2474+ee47094a3.tar.xz"
  version "0.14.0-dev.2474+ee47094a3"
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
