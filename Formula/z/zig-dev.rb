class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260601-133113"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "08342ee0545b87a0c27cac953bf57f23ca27bbb8daf405f8182aa5dfa4fb3ee7"
    sha256 cellar: :any_skip_relocation, sequoia:      "2e22f9aa634c1f7385f8a4b0977b7422c0a96f02060affde577068a559c323b2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3c6c43ffe00cf604df630577fbb64e1cebd725ae65cd578c753630148769900c"
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
