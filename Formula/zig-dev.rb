class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "eac3bd18d6d828d83f94c2f20511cadec5316c4a478ca2106ea64dc65b16b2db" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "398d7e54f44f940d4d6c02e4922d89b8e7c13897e2c7ccb4a4a8970b8ba9975b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e1957088227591378d0ad489a4c57398a1a229df187a5641907f02fbe239d44f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2791+50330ec22.tar.xz"
  version "0.12.0-dev.2791+50330ec22"
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
