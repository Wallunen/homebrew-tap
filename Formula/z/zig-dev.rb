class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f80c114a8a1936d07cf1ccb32fbccd445d016ba8a8ef5f66cd2a9e36aae562e8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d6d733ca871215ba733a2c4f4908b0271472c785ec960683417660c4bd6ae122" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3ed39e47fa6fbb73ba49374fb5b157c4fdc66335c54e312dad5cd2cf5f1cb248" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2178+bd7dda0c5.tar.xz"
  version "0.14.0-dev.2178+bd7dda0c5"
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
