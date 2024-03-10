class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9d8550a6304321dec0742bb08bb21df8b991778b3cd86812c799062a25582cdd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0d841e6c1b3d6850e720649c11ddb5babeee55497ce563759c5be06d39c3d993" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4596d7d799def2b53ac6d1f7e2ef78fa5186378bcf168a1c432ed1d196aff061" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3192+e2cbbd0c2.tar.xz"
  version "0.12.0-dev.3192+e2cbbd0c2"
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
