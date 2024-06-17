class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "10b6247dd8e1d4580f5b4d069bf17161273ebb00e2ecb21de8143bf55f4f5728" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0d80a97f78b4934fcb15f5966e0a5e923297e951019204f7541218d12e51cf77" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "636e5491175b83e68591af1a3a0eb0c54beba188aa6ec2ff1cda480e6a6feb43" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.41+8f27a4370.tar.xz"
  version "0.14.0-dev.41+8f27a4370"
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
