class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260930-033650"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e5fc8fac4673e589bb171ebf7ba38c1bfabe6404dfcd1fbb888a3fe40ec6a08c"
    sha256 cellar: :any_skip_relocation, sequoia:      "55f8725cb234596669f0c9b5f90b2c105cca44b74873d34e3c9b848e78fcee54"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c5426fb7a4b18f08460a8bfbb7cbb15bb2b883d3cf73f307a76e8d68b933af3e"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "15bc1310946a5f7573a24a003cc95fdbfeb99124ef21cd8ea0d5370f2fcd7868" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6823e45e4f4b9b7eab5230baa06d9e59ea9e1f19e88d3eb29946d02111bfedd4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "95131f1725b8d29a160d8c3fc9d1755fcc06e9da3c523c55a636ca2350e206c6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2338+b46a7f3a2.tar.xz"
  version "0.17.0-dev.2338+b46a7f3a2"
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
