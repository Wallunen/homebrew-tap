class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260920-025846"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "fbb6c13215a00abc5d866169b5cd9727477333856bd73ca1ee48886d56cac6db"
    sha256 cellar: :any_skip_relocation, sequoia:      "4966246908e6168dac74b6f1898453f4f599b0f098e36c542b62bb3ca41fa18d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "45abb0ccb4b73479014f7897b75c1d5740d2e5b419c3eedca6e8514fc1ad654b"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6258fa98038a4f6b37b974b844610897178ac4ed4e82610940e87f417454ce2b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "98faf6b77e3d681bb27bd65b81dcfc18ee21c437ebb93504eb16731c613fd792" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c37f70cb639a9ae00daada04d83cd4db518793cd4ce14d9e2d38bd3300d63142" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2248+3f6a02acd.tar.xz"
  version "0.17.0-dev.2248+3f6a02acd"
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
