class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260401-164744"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "057214a73e33a52834c14dd8935d2429ef2fbd9509898a9c48ebae2b0f2f7b32"
    sha256 cellar: :any_skip_relocation, sequoia:      "bb2812292886438d8d0a5df4b5398d5ed3b270141078d1ae263aaf16f3683012"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "09aea7d3cdbce8bef68c76a0b3d712f6a1e16d9efd7cbd5f27aca0050065cb6b"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "37f0b362d3b5f5025198c0d08b33ae3ab521fef99c00800964153dda8ae0dbc4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8fbdec1cf3f03134eecd01a1c21e00bdf3fe4cf4b185576ed41a7b3ab69c7fe6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5e181657e0d159bad97ff638d1f73310f1aa2fc48618960de564ac1f777ebe93" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3066+da78940dd.tar.xz"
  version "0.16.0-dev.3066+da78940dd"
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
