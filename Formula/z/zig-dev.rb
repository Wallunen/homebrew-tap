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
      sha256 "d675cfdf903206f4bbd14d56e2b8aa5804f321f1962eaebc535c08266e0f8427" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e91ba63b57e9c0fc6c4a26121690816d8b45cb7a8d1711904d9f4211229e94f6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "06635dc339ec7aa652087b9d96e5ba93c8be6b4f8a8bc8baca1670902d200718" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2329+1b7a78122.tar.xz"
  version "0.17.0-dev.2329+1b7a78122"
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
