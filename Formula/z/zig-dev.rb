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
      sha256 "2b154b47ce5396c000260c06c8cf018a4bf22dd5f858fc8538e27f2012d86536" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1081a0318a97f492aaca1b76c4e6fe1ce5cd586a212ee2c0db364b05a29b5870" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e6e5c7e0834626bded90cd786d148bebf211dc80b013afefd631472b57b41f77" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1683+5ceec001b.tar.xz"
  version "0.17.0-dev.1683+5ceec001b"
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
