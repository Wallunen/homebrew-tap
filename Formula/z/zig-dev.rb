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
      sha256 "46e5c668d4a03feeb92f88476cc5aeb7a95a9902251ae5c70268907357df397b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5b8ed7c7cde2877db157ac2544170461ee0eaf38235a68f51907e9bc111182af" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "719f5612fddb58eefc33735696e3b53400f2794e2b5324796dc4f94e12fd5f05" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2127+e90365cd5.tar.xz"
  version "0.17.0-dev.2127+e90365cd5"
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
