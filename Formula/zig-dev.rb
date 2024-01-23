class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "be2c1c74acdeef8f01ddb9464de69c2ee59783de6374d5b759f1aca05e2078fd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ade937d2adabcdbf22811d7cbee72991927f55dbf5e512841e0b83bc15af2058" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8268f35060ebf002ee45dbdda174be8df7b6b619d1bb4384bc93df62cc6ec2af" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2327+b0c8a3f31.tar.xz"
  version "0.12.0-dev.2327+b0c8a3f31"
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
