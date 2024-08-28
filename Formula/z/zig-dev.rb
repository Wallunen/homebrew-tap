class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c6278b8db88224ca83f244bae174b0824ad1fa22874e983b5f41b559bf7d5aaf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bf87d0ea9314548efbf1683a78813f9930067d4e735f654490728c2a53407b6e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1c85fe12acbe965656dec55883ae2037dd6c627d4ea65db6d475d0e306b8948d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1342+1a178d499.tar.xz"
  version "0.14.0-dev.1342+1a178d499"
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
