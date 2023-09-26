class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1c149fc66413aaea5200065737f2c2807a97da02b4e8876d5077e55e0267e85c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "acf606eefa20ba5212e1de387a7dac6ca8533291506b48ce9b99071a6aede901" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "98995cec3b9dc4b82e1b298414da5913d83524481142b626b481fcf307599432" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.596+2adb932ad.tar.xz"
  version "0.12.0-dev.596+2adb932ad"
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
