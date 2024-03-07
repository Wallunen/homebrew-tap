class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "82970fe76f2aafd0ecfd9106d1a71c522961a1db6cdf6eb86bc4452a1fe56063" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1090c9e92655b0c489676fb651315a60ced369ee61ff7657c21efba776555693" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "13f4094dbb73ae04be616b8fb6443e5279b5c7312eff7ff889c2e40c3b6905da" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3160+aa7d16aba.tar.xz"
  version "0.12.0-dev.3160+aa7d16aba"
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
