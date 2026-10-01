class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261001-204432"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "539906626a3ab0a4aa4a7814e7f8308b6c049214e6c206bdeb58d39ee000a410"
    sha256 cellar: :any_skip_relocation, sequoia:      "0fdecce89ac3475658071e17aa3e70f8b34cdf0d41e5f1ce322bae07f724c6e6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "90e272194732e438c58b26e0b2f91b43f46d02b625477406b2be6631e82437ec"
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
