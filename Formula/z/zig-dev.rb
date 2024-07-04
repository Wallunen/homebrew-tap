class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "22eaded7e2667a430e79bc84347195fbf0670795282e356ef5850999187e5cd9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6fea33fc3c6e76449760099f6574b70cf271fe09e9036d47f38bbf66e12f7fda" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "54f74b4e13b35f8819bd13bbd7cfd8938285a0df367aaae018d2904946e5ebae" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.144+a31fe8aa3.tar.xz"
  version "0.14.0-dev.144+a31fe8aa3"
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
