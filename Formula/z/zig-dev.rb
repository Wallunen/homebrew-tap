class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-d6e5f07d"
    rebuild 5
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b2eeb43195abdfa452b541c56f6d74a93925ddf835a7d60e87293d460508fc95"
    sha256 cellar: :any_skip_relocation, sequoia:      "5dc46f1cc1388a4c4fca5bfd47ed886c60de9f50228e266900da5fca8c59a8d8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1f754730173ee2efcd5628da782ce0fd29c8c25c8d1844dc9a5b956aa8ba4c1f"
  end
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "94233317d2712d0071878411bf8faae141768e337691ffcd45cce883858275a1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "18febab30e3c65fef6c2ea80e339668e2d0b17a303ea7e3dd7368af139142e11" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "08cf4ad6487d59bfca56f5c2cb1ac8f02e17d11fcf725b905b752682d6674071" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3028+a85495ca2.tar.xz"
  version "0.16.0-dev.3028+a85495ca2"
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
