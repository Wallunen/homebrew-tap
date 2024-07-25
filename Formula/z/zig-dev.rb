class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "414e5f693b1d3795ac2ea441721577792cb7aeaa5a3bd681683e42acba0784bf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e1deec8954ee354099b6a0c04e117f196607bbf3f5a3cbe8c633f7587f66f7c7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7714048640480fca67c0ff692377d23f939179332c72221d2cd21eda76e71ef6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.564+75cf7fca9.tar.xz"
  version "0.14.0-dev.564+75cf7fca9"
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
