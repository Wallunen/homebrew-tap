class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "98c38a38f7b462f663ac6692abbdae4b62d4218e4c72980dca1c012dca62a10c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dbdfb0bec1b8291abd392243dc95478942e71fe182af72482c88619b52028082" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ce2d9bfcbd3730dea5d570d0113f37ed5dc6434b5baf69c9dee2e808ce9447ee" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1217+dffc8c44f.tar.xz"
  version "0.14.0-dev.1217+dffc8c44f"
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
