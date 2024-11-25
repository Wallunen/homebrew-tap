class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "02bc43055a52b4fb25afc054fef63a00f89fb9604cdcb3e8f0e7f72e17f3f594" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5991116382e54ec3359e5da47c6acf3198b1916e7f6787e2321013a5ed0daa83" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d6a94aab219ce9ee5e52d41a2878eb35cfc496069e1a3cef746b6f11db828b5c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2293+6d781e095.tar.xz"
  version "0.14.0-dev.2293+6d781e095"
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
