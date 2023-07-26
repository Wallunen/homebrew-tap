class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f2071edd4029704d754e259c9646e9f9d4544a96d6f68ea490f790a4cf1c708b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "32483b846460ab40bb856a4c102f29fc8daae37f3465421ef1015ed0ef509cdb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6d21b7026cf1cb182bf6c705605b68aab1f109c114a35e06d704e9c308e3af14" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4238+abd960873.tar.xz"
  version "0.11.0-dev.4238+abd960873"
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
