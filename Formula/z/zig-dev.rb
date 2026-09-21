class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260921-025559"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "916c14a5c9f091e573251ce2f90f977688c5cf06edcf9e57df1fd51191c7d9c8"
    sha256 cellar: :any_skip_relocation, sequoia:      "c82754a599abdefca2031b22549c0240336e3dd070d99c4fba3507c82551f339"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fe7053cd9ea7b3046e64c97f5bc3782ef91ce907cb6f5a43364979fd1b1d25d0"
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
