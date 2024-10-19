class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b4197bd5f6f8d94c37648cb8ecb7b17ee411a5be4572bfcd6d0e18c00305e053" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "16e8f3176751f0b0b1ddc597ff2767ff301e5924d032480b94cf59188a79cf8a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2f2f486504d652f55c4a53481a7eef57d669ed1128da3a5d871f182c88140cbf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1951+857383689.tar.xz"
  version "0.14.0-dev.1951+857383689"
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
