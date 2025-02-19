class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "435fcfa402cddc249e1e727a417ab1ade26c643a13222edb14b5261a64a707f7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4a461ad310f043008b8c9b2bbf0480078d2acbc90d37418e3f4d5eb48092ea80" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "855fa28928a79eebb70b29595ab9952bdf3ab258ef3e266ac2e366d815936d9b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3258+d2e70ef84.tar.xz"
  version "0.14.0-dev.3258+d2e70ef84"
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
