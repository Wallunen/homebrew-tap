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
      sha256 "8f6911f281418b97df7e60b043880e843e4c4cc7536afd8fc2345a63654cf14c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c95e564d3655d90672409f7f6fba63fecce3f24f98dbbe8ccbe26a6b62a12bf0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b3f9cc7098a72d0ffe5bbd339f572344338d30c32419a8f4b244532fc00409bf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.644+3de725074.tar.xz"
  version "0.17.0-dev.644+3de725074"
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
