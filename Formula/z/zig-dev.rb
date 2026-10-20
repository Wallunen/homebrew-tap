class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261014-195539"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1950faf868abd6032ca329052de0b9ea0c322d2a858d7ba21496f45e9d60fd6a"
    sha256 cellar: :any_skip_relocation, sequoia:      "315f4aa72b0134ea65798aa1bd9a663d74a9e4ff7a06451ad508459d7b83db0e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c9519203eee53029a799a78326b606b6fc0a2c73447a4fef51abd9b4b03b5095"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "11092a08ba7f025f6cca952b090be15546e7d8f6f6f7f5dcbcbfe2ef3bd9167e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "57151d70a2d622e05d3bda7ddd34f8cf6af2c74eb64221ff84784856eeec7ce5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8f777ee3ef3cbeffa763bff45ef1efa36fa37d3e900da418f3c218a35b7aaa46" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.18.0-dev.362+705a6b4ef.tar.xz"
  version "0.18.0-dev.362+705a6b4ef"
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
