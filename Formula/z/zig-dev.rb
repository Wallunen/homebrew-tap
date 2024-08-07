class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "075a4870fe84dc47ce3c92823c42711d16ee45f79cadb8fda50fb45459d43d7c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6b5fe194e6489a74d7aa397ccf4936ea1134a6fb844a0920361e22f1325f2524" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b999617a845be425d103a909b0f00e0f9905d93840219f8ecb79a9811c631618" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.855+de1fb1990.tar.xz"
  version "0.14.0-dev.855+de1fb1990"
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
