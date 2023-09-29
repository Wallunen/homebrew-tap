class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "82b3fe386b504d7aa76d27a48f535ec3db31492416914fdd0d293ed9947092e5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "62dac2bbc2afcc5409d63b5858acb36c6f65dbff9ec13d74d04081e217089c23" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "797d87a32903f32c8055d9ecd3b5dafafd1d90630110ce9d13e0b5fad1053bc1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.640+937138cb9.tar.xz"
  version "0.12.0-dev.640+937138cb9"
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
