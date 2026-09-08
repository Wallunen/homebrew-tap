class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260907-135239"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "fbefae996444a6dc45e7c75d8a0867c829b257cd93b48c3d30f4327c3918a329"
    sha256 cellar: :any_skip_relocation, sequoia:      "e8ef24c25375dd954b54d892f64a0f89b5235de2e07e7c772acb9980b9856322"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "25c0c230d71fe3f8c174c6b95c21c0544791f44a7bd23914688ba98e63a98e44"
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
