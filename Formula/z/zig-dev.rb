class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261001-034220"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3dfa5e9564ee0531e4810980e974fdbb70b5e046c5965a8fc42510d09539ed06"
    sha256 cellar: :any_skip_relocation, sequoia:      "8a49ce56d96eb780f08f2646916b648a80e59f80ed9a30fa609ab386438b1712"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "028aeed5ea232426196068256178ec1b0d5f2d8874311dd68bd68a0510e3ed91"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e1af37e5fbe83736aeca682c691fb1021e873339180a7f187de5f84a949d9646" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8a2f0fd0f92d09f30a55af0cddd37f4a5e9354abdba0dc294c5e998933626faa" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a417a92a6b3af978e9b5fcc8ab1b36e64e111d1f8ed50ff178de92910f34d653" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2384+ac77c23af.tar.xz"
  version "0.17.0-dev.2384+ac77c23af"
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
