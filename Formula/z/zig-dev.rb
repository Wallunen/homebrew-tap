class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260921-201340"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "889436d33143dc68e67ff0dac738659dccf50cbae273cd1e6ca2660db0f7c77d"
    sha256 cellar: :any_skip_relocation, sequoia:      "36d5532c569f05dbdfd2812d258ae666c3b1fb11bf491bb816ef7830e2536c88"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0f37040f0d39dd938b3bb963c0b170f0b23677443c9432ece19f98ccd2028c66"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a69088fd25da114f26ad83c59cab50d2b56885ade6b825afb889928a3645a09a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "700349d09dbf8b7708640abe97147a759ee3e80d21ab2673198d6226751bd6dd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "aa075c7564c8839735c2964750a7c502947483d0bbe276fbd1fc771918c9c198" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2251+1175a3e99.tar.xz"
  version "0.17.0-dev.2251+1175a3e99"
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
