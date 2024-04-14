class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "078294763e9f43798e92518c854a4d92729782663f1879b4d914d6978834dd59" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e117606629effae977ba7f4f8740b8ab29cfa089127bf5fa4b7416a9659f8590" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "400831d99fa54d83e46402ce1c63fd74dcf5428dc219b681b49716a9a4286299" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3653+e45bdc6bd.tar.xz"
  version "0.12.0-dev.3653+e45bdc6bd"
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
