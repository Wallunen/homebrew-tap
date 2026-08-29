class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260827-184436"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6ecb8539c1b6b19a1169a4beb97a8e9c9e3a59eb404688a40463adde9bcbb2b0"
    sha256 cellar: :any_skip_relocation, sequoia:      "206ad59e48873b0a08dc4206f682758a9fd0ee6441f53e1d9c4f702b5f049dba"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "50b898f87e6b30f9e176d890b26ce39517f37cd485291ca6b189dfdfeda8b5a9"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "75656e1afeddfd4b5b817950ddc420c0047e453341a46fc1a540c1cf34ceae2d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2c502002b37709406d454f55e4165946316d9a4c669cd025e74c30f3b426da19" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "70f35d11bbe1729e3f294ed62a3aa2cfd24041be8e07df2b58e325232baf204f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1902+896bd9e15.tar.xz"
  version "0.17.0-dev.1902+896bd9e15"
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
