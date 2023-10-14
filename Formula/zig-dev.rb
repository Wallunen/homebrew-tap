class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "39b32b1a7b2595ee3a28c78ea446c1c1377f3446e42916a9b45cf1866706b0a9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f1f2dbcc755bc2331c2e56e789964f8a96a940b6bf63c184213910ac119e29e8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "57575048525a33e0040437d33277600c0ebee0f51e3aadcb8a1cee66d1e442b2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.903+7aa85691b.tar.xz"
  version "0.12.0-dev.903+7aa85691b"
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
