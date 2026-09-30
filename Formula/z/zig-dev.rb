class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260929-034840"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "15787872ffa17bc9e6b19aba0cd7c92bb8e203a5abe872fa505e353d299c9983"
    sha256 cellar: :any_skip_relocation, sequoia:      "a0957ad838724debc8917f6b89712721358e48abb9ed1e9e27716276b1c5f6ed"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "122314d1564bcd780a64d0082b82ab0dd3af9a3ee54ab91784b6f8f2814abc78"
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
