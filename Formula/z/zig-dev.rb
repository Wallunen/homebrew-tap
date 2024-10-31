class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "78fe14d081876239d91362f456b2bd46a5c2f5c0eedec62c45469fefe438b4c8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5e0c1c9247fdbdd8e3af2b3c974680e71e68f100e6054ad8b2b0ff0fe65900f1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9807fde1d1d58764a3c529e67406164055e80951a71781b1646e03e4bc1e047c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2078+17a87d734.tar.xz"
  version "0.14.0-dev.2078+17a87d734"
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
