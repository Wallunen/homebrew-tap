class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0245bc2364cad3927c8857ec63d05c79add69c8b0a0cda3b647c0673ac671c51" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1f398678312111142a998946d75b715f36bf37f77fcc1134607453b5f609057b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9465236c592fa17b6cad6836b7ebcf7667d4bf5c7a6e4c3f96aa222d02c10769" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1504+81219586b.tar.xz"
  version "0.12.0-dev.1504+81219586b"
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
