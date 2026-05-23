class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260523-165437"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "85b86e01455dc264c1c171a38226693051d875305e3af51ebc9e480ffab506bc"
    sha256 cellar: :any_skip_relocation, sequoia:      "97306d95c20e285536dffd9eb907600a54c0c448e7fa65a814b950c4dbed866b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "31b5e3af6fea2ef4ec9809b4df6fea7d65af232fa136ca79c493034f44eb351e"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e9c67bce5dd42ec591cb8100a72fc349974033309e492b2b4ff0e475d4914a4b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "34ea2dea8255d6c64ec3126a420b8f2e4d0be3ff0a42f1f4264db4b58bfc3131" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fe4fd0b0239044db019c1898b4f28886903fee59ff8808c6b904358fbdaf7b74" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.332+4a65cc4ac.tar.xz"
  version "0.17.0-dev.332+4a65cc4ac"
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
