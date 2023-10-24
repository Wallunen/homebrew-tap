class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "17f75fb51f7e280d8df93b81df480363451b9f498f6b2f8da98d00130ca331ae" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "670ead5ade11c047da761f7d848d309720085beb15c8641ee7a79e850a1b6168" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "76722215037bba04bb6b88becf70911f3cc833b7337f94fa02dd1ab38f1c9836" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1243+6bf554f9a.tar.xz"
  version "0.12.0-dev.1243+6bf554f9a"
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
