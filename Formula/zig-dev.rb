class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "aee7d1ab542d23d3910a771089c22e936f7536f95d4f52369f5f3937b1739f2b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fe3e7e96b8bc05f1cf95cc59b61e601adadca2051eb8591430bd1cbf6ebdbede" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "988bb1a8753c73e36ac78887259cfe38bcdbebd86cf7adec8ad26c2656d877e9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2823+955fd65cb.tar.xz"
  version "0.12.0-dev.2823+955fd65cb"
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
