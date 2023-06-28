class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "36f56b8bdd45ac137f370a7295e5aa1cf58cbd1a0575f17f1f311ce2ad445e25" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a31b555bc7542f8850c7cc766205822da320e216cfee9629ddbd7fbb4b449b65" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "51f5c01abe049c490e2d02a59f5ce707a83be265f170472ec497a065396ba255" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3879+5804f3f75.tar.xz"
  version "0.11.0-dev.3879+5804f3f75"
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
