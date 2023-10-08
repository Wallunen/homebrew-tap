class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0c8e538c0bff5d03e0ad830a6b8d9f17b61bd990fff2de1850b535acb8a113a5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b9a2203f9f99adb9f3e8fb1f8af2f7b7e1f10d347ef0979050a0b224c6791ada" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f9a46d05cbe10713b3319b59a454e1df6f4180b31ee43be2c64afa9363256f25" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.798+5a4a5875d.tar.xz"
  version "0.12.0-dev.798+5a4a5875d"
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
