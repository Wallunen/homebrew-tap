class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260401-020526"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "59366293f18358f087044ffac762a0b52bfc26f2832915aef52b88971cf45c02"
    sha256 cellar: :any_skip_relocation, sequoia:      "8c09033d41857db5c3bde2c7c9e31088d6e9bcf527325a67a1b98adc9e83d44f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1f5d325b49a5661bb487080c84915e74a769d7f3723f3e556a64ff5b78580689"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "93657cdfadd57dc4d573634ad989a8d8cebbf20d2e7f84a393cf09bbe1a26101" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "368125b2996d69eea3b2612f8adbd504675d9aa8462b34d5c1a798df705c1b65" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a3180445be902d177e137f5352efa0d1733eb7f0061c12b40363bf173d5a4518" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3059+42e33db9d.tar.xz"
  version "0.16.0-dev.3059+42e33db9d"
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
