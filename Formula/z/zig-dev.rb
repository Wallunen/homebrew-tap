class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0f6836dbd9d6e9bc0ca9120397ab82f1fb00dc95eceb27501970cea10ed44cdd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7928038c9d6b64b7ee557b81065adc96f606d83a831ac4e20de3e796a8eb74b4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a8335c70246805c6f8e66e4c73d35427db24f4f45958cc455c9a212fadd3c9dd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1063+1018cdc0a.tar.xz"
  version "0.14.0-dev.1063+1018cdc0a"
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
