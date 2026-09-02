class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260901-031007"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1eff25fc22afce5c5f6f0203aea534709dd2fee8029480909278a0f7783a12e6"
    sha256 cellar: :any_skip_relocation, sequoia:      "ddfa6384afd5c1a4ebbffae3169df236e33c5e71b923dda8d9f33b74c22ebe63"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e92587bbd00e36380e7654e49f508480703f70df64061b9a563a4ebe71fbe148"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d2279bff3e09e19473877a96906295145ce237db25278ac53896d279d25cd6e4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bde1e44e56610410142d6fcf45925bf94ea31000c5c3a7b6ee95839e7d26c44e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d9202688fc47f931fd64cc77b198412b070b21a3669d00ec469b58df35501e7d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1963+e00c6c439.tar.xz"
  version "0.17.0-dev.1963+e00c6c439"
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
