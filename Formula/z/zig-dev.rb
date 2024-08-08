class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cdef3ade0f09c9003e14ae51156ec1af842db46205d6cffcc949a2678ae4b178" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ebe55632573a2c3b4e0b1cac10eeccba6f8761893751a3e8f6bbf92041e0c1c5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a5bc7e20c10dae1d0d004e731c81c9a72841caef43feb46653c14f9a8d876e81" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.875+ebd0c6ffd.tar.xz"
  version "0.14.0-dev.875+ebd0c6ffd"
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
