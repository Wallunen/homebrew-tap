class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "18f68876356ec486365e4097918c81381d6092def0b91f2c404b86844b0cff3a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "738d65d976d8613c5afef7d2f3dd20b06dbe30ce8b1b98b78d6624951740933d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e6d8035f938de86c9d7383fead2e59be37dbf32bbd8b07e3e3177aabbe5a1757" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2254+195eeed2d.tar.xz"
  version "0.12.0-dev.2254+195eeed2d"
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
