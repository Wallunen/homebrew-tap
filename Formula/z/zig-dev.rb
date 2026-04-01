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
      sha256 "14147b7a9451fa63a67b22ea89232b0b63a65da6b4cde7ed410057c7e725792e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "25ac3b6b8ce64e0d4750955c7878145b1b6b3eb80795c76992138cfef9265ab2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fc3af37e3d8d5caf0246f6afeda59f3c5f69a24c5b0ac97ad0e5a73d76af214b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3061+9b1eaad13.tar.xz"
  version "0.16.0-dev.3061+9b1eaad13"
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
