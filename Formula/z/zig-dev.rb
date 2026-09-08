class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260908-024048"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "969d46b980333f414f047f539db48ae54325befd051bcb0d5d6f8c5e03f666f6"
    sha256 cellar: :any_skip_relocation, sequoia:      "79904fd01df9ca589d56665a954394e52ae05d82bf54d8f1cca483d5997d004b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3d233bf27132f95bb62ba7c4888bb1171e96e28108270c030050f58f5619146b"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bdb69ba580b53b526adc13aa1bba09e8baca1d7369d1ac43855366fc788d3eeb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "04abb39c04c6a6bf880ad9a65d28f91de5de9da87a60ae59b1817a64bd8408a5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "73d01150133b477853b7a019ee991b8392f1cae17396a22f1830f1ab6191d51c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2056+79a9897cd.tar.xz"
  version "0.17.0-dev.2056+79a9897cd"
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
