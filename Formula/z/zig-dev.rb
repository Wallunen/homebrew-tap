class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ca118f4d29d52ae7bffd5ccd78c4e077dcbb5172b0ccb2c6580a71a60ac28212" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7d6910d63c2eb70c2299d7f48b1c0ed566e0009848bcb140f6e6a41acc40f6f3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c35a1a743673e6a1a187d26f47ba2c6971fa33dc8eaaf4181ddd4725113521e5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2456+a68119f8f.tar.xz"
  version "0.14.0-dev.2456+a68119f8f"
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
