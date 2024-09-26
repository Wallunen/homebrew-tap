class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1102fefaec00136ef0531e8437948a5f6412e8de9cf73656da7cccd069ba149b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "55a95296cb0b6d53fabb2ab0b3fd8aded0e7dacf5cfb472cf5b31d9aee886f2d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "32b05a37458793efb7aade0dff0debabcba25956be626d891cf466445546ca65" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1658+efc98fcbe.tar.xz"
  version "0.14.0-dev.1658+efc98fcbe"
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
