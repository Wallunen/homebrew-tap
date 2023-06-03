class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b6a4fda4285046ea92f654f6205f5d6132806919c30d72112304e1274a666e53" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fdf6102156268c9fec1c92901f633045806ed0a4607b0cdbd6e719cd6284abb1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3fec23a3ae06d7016dcb6f69b4d621cfb2302d05c5e428aff8bfd35b6b574b83" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3363+9461ed503.tar.xz"
  version "0.11.0-dev.3363+9461ed503"
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
