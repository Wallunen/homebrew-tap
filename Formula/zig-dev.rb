class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ed69cf9c51d31bfcc9dc16aaf3563365f7e15d83811131cb1ae60032919d4ad3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1c32013c6fd4ab862f043e1a8833f4ca2fe467886a6c46336ede6fc6d03a5544" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "200975089bf6ec21178112ad990549b1d56bbe2a187fba388346bf77417b33a9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3332+76aa1fffb.tar.xz"
  version "0.11.0-dev.3332+76aa1fffb"
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
