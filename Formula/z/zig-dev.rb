class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260912-180137"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "fe09a85bf706d3176445c7bfdcf24cc937f03469519f6aa20e3b9c58a94c60bc"
    sha256 cellar: :any_skip_relocation, sequoia:      "e568a25629b61f89a153d1bda0e3c826e49cceb24c633615da302707a05113a6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cf368b85d9805e009ec0fa1e84582b8570b6ecb708235c6a7ed9801940122b8b"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d766afa7c58c3f1cd12d16a1fc264eb7f9a0d746a9d993c5e0dcf607353b15ed" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "eabfb3fef4e1e4a9e9b066b777d1bfc3ef81ed882f67dfeac78e5ba20b353b05" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a18a1a2e7ae57430a864cde3fa7d48b31945fbec1600498815e1998e702a3e95" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2125+0d600e488.tar.xz"
  version "0.17.0-dev.2125+0d600e488"
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
