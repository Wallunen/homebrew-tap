class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261014-195539"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1950faf868abd6032ca329052de0b9ea0c322d2a858d7ba21496f45e9d60fd6a"
    sha256 cellar: :any_skip_relocation, sequoia:      "315f4aa72b0134ea65798aa1bd9a663d74a9e4ff7a06451ad508459d7b83db0e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c9519203eee53029a799a78326b606b6fc0a2c73447a4fef51abd9b4b03b5095"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c3a58bbfb956bcb520bd88728bac04505953f0d5c4dc7b7d50b504c962769c22" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b834337a807821e0d9f4444c64da0e3f1ac9ac01517eef290ac9e566edce38cd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f07a471d35126174df8ace5c4c605f09dcd7df294371d9f5f0a4e79804687421" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.18.0-dev.367+187d0bf9e.tar.xz"
  version "0.18.0-dev.367+187d0bf9e"
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
