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
      sha256 "dcd886d0872cde3d426cec62716a74259f5c83a26a02bbc611fb576e244b7056" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0f57666f4913dc1acd769c6d038ac3e2af7815800ea5419c2db482b720b3128f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b95c7cd06446e7ac83b34554c70f1f99a92d1abab1ff2d222b2b2a4ca0fd250d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.639+284ab0ad8.tar.xz"
  version "0.17.0-dev.639+284ab0ad8"
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
