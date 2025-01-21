class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "414191621981e2771b05f48a87db07158e666c78a84f2699eeb29776aa8b454e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "03ca1ad191ea4025df77e1dcc2b17c5297537d783f53c5ddd6bc50e00dcd6784" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "60a673a0a9eef7a62a61dd5b12beca02b7790f001456bb844404b72a066f063b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2851+b074fb7dd.tar.xz"
  version "0.14.0-dev.2851+b074fb7dd"
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
