class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b95d26889d1394b9c7681c542c2b335391fce9db948d48378aa20d25d8c91e6c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bb100c3d1f438b8d35efbb1ed6e22bd2c00959adc0104d50309062e76daf77d0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2155349f94e103adbbb8fdf70f75a15fd638ae4cd37535c4b5cfeb9b25cbad49" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2287+1de64dba2.tar.xz"
  version "0.11.0-dev.2287+1de64dba2"
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
