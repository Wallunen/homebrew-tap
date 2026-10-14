class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261013-153000"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "816697a89487dc829df89bdb228cd61bf12bbbce575be85c37d6df3629c72532"
    sha256 cellar: :any_skip_relocation, sequoia:      "da63d555eaf827830604aeb8dff1da4c2b2536ece30114db8f073a2bf804b097"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "87ee191bd63887fbdc92cb66dd6a216dc2d608e1d12d9f5510adfe84157ef04e"
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
