class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "697dba7c7fbb7a4ae80aeb1e5346aeced0dc6de0dc3e43930555e531bed2a117" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7c7e04f32b335c76dd593bceb294530805f4b3daf9a9dc9b58e947ed124162f3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b4e98a8bab0f03abea5de2ffa44768f50cba7dde6ee9e844e4b18e40d964cc5a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2763+7204eccf5.tar.xz"
  version "0.12.0-dev.2763+7204eccf5"
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
