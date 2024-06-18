class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2627225f1ccb85acce5373988272fae6c9b518b13db37ab1fbffce3fb159eea9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a04c63ff75a2c7e997956c888da07610c3201929b76f87c97283489826437ef9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4065e674352f2cfdeb279e37906a1e6529adfe2acb9604dec239b9102faa1837" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.61+04e08ea88.tar.xz"
  version "0.14.0-dev.61+04e08ea88"
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
