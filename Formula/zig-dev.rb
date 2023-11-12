class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2a36f044687a6e3389b42cc6765c7c4c74faf47a973e411689e517dd48b2d6a0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "037e3b8b23612c0672ddf250d0f2c7aaaa4a29368c58a7d22e19494945cb44f6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cf7d7139b8aa26c979a06dac73fe2a6c00cfaf9d7a43f197c71333b2f310936c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1583+97e23896a.tar.xz"
  version "0.12.0-dev.1583+97e23896a"
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
