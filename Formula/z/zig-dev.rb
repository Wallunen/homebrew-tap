class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261014-031138"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b85998329552a6203242da1492356e53abd2a6480fa30dd21db038e4ab39ec3b"
    sha256 cellar: :any_skip_relocation, sequoia:      "a679c602d136ae5d4cf4b259ebe05f64fc431009929eeb592dc48b2b5bed06be"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "388dfefd855541edfa98b0e3623af2534793ac118059c6af4d9fe9acf9f0e771"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c98f5a68d328bf4bacf6d110da4e7250f8af62b745eb70a3c4f0fb7f2efe1c21" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "268555a90fc72e281882b2eba469fc88f0005aee26981451a9d61bc4bca3f302" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "459786723940a29c19658d7d34572dfe87bd1ab933d9286d3b51fb5656e3eb17" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.18.0-dev.252+86dc5ce25.tar.xz"
  version "0.18.0-dev.252+86dc5ce25"
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
