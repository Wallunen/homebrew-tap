class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d0784c04030b21b844667e6c29c56be38f608c0648eb0e1ad9a0f7a6a4191a49" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "757ae87bf7f3884db01a22e6da1851889c823dac4227bb66fe2503f64d9a6375" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "531378e4863868b22b1894f511315f52f0627bf81291df6c5448be46af597b4a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.700+376242e58.tar.xz"
  version "0.12.0-dev.700+376242e58"
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
