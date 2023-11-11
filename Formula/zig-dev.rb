class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "89f8b97c306706aa80a0d374df621246b50d9f5f03c271a769dc91042ed13a98" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f325a5a013a20345144b83e577004be9dfe7bbedda2beec2b31ce1bad427835d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3e1db38ff2c638a78dbbb001ff8a033406f2428204274784d4a2a460d0043de3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1571+03adafd80.tar.xz"
  version "0.12.0-dev.1571+03adafd80"
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
