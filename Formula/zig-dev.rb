class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "24f8b1aaca035007d70a3f466c8ad12c67a290880a6529a3258f05769e11af23" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ac9a28039dc54725024d27145896899933ce495986e4a8f468e68b78a9f87c98" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "aaf98948d9d6e9ca9a1654499d3fb0c5f2ff98a777cc92ec3c3d46384e3ce72e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3124+9e402704e.tar.xz"
  version "0.12.0-dev.3124+9e402704e"
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
