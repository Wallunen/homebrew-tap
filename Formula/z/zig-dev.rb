class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b7572b0ef25fd8145871e431b64c8bab19d1ed72474699a87f3dcd4439975a4d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "69b05fb71acddc3f7e1e68838c9294f1875dee9b2df28ae94da2c0b9f9d8980b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c0e86349377528a6e255644f3613ce844b8886e86c0e74c5a6f0d136a5600673" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2415+e62aac3ec.tar.xz"
  version "0.14.0-dev.2415+e62aac3ec"
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
