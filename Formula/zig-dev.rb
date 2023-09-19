class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "909eea15425b74f24acda300e0d3b70accc54abe9b4c6bfed4092bb89f835bd3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "efb097f59237716531147567c1f1342fde98291dbea1d26695e02ef294a7f54d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7923f3dbd98916565971d6d9f4fef84d99fcf2c4f39842bf64c4c1a29148c905" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.415+5af5d87ad.tar.xz"
  version "0.12.0-dev.415+5af5d87ad"
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
