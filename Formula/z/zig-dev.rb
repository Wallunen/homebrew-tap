class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260811-084721"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "edc4258f3958536dfb35876aa5428f6df6e6e6fa84bb45b12d8f2489257f25f2"
    sha256 cellar: :any_skip_relocation, sequoia:      "3709929445955727155f973523b955b95ce6ea183a07d82e9d6dbd7005e509d4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9c7db168031a81834d3eec678f9badd4a0f6af16f7d56829f5e7bdb4e6fcbf78"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a1f50266a2bc2099017e09f9703d0c2241e44145e11cbd19e3701c60ea7f8f0b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e7be04b0bf425cdaf3f0f400140ae297f242b6c50d3936cb7d4ea3e6016b2484" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3b4059dd830aafd2978c47f92adf14094ff2e5cfe2ab79b47b8e52ccc76e2135" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1676+c9dc9b798.tar.xz"
  version "0.17.0-dev.1676+c9dc9b798"
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
