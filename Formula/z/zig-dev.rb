class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-e584307a"
    rebuild 4
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "62e63818851d017b46c45477bc5dbd294aabbc0a605dd53059a130dd430ebbec"
    sha256 cellar: :any_skip_relocation, sequoia:      "650dc2cf078d02e17a6d790e1a0e00f66260e21b55a5dc51eccb07a5e127ca91"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f37b0c0ecce4016a300ef16bcbe0b871e76dd0659619270da8df4e719e527cb2"
  end
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7835cfe2096e7fbf31d318b87e56d2a17e1b2e67e1e2eec812fdf936ab28df66" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f019abfcd40f817acfcf9cd856ace6c5ea5450f30bc2a3c659e6bfdd3b397fed" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "344e80ae57c3a246858b785ef8e2f40acb0a94b868e8d19cee658583d3e9ee55" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3013+abd131e33.tar.xz"
  version "0.16.0-dev.3013+abd131e33"
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
