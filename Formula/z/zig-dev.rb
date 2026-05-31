class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260531-170040"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e54d6e4a1e0de24e80baf9a8c2b3d0a8afbc47ca0b39b9ac461c7ee60dc0c053"
    sha256 cellar: :any_skip_relocation, sequoia:      "31122baef1d6783c1e499b56ec31771c4db09af5abc63f91992d3d00b7a1a137"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e3c9813ed9f0484a0cdf0424106399b1ad27f5995807df176ded9e200bf98a53"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "950b5cb8847ddef8a7ea003b685004fd8bb4ae26c4cc7eca2f49705cf8639309" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f45f9e597a3a638616b98af88ed8d867688742ce6be95bbd371b42129f89e30b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0d473b20343c4acbacde0b76052724088dabbefb58797717f7f92c3adfe392d0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.633+9c5655093.tar.xz"
  version "0.17.0-dev.633+9c5655093"
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
