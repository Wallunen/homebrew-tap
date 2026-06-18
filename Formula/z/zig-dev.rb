class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260618-182235"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "87f608ebf9c223322d71cdffcbdf651d89b30597780ee94fd0dcb68cde4b9251"
    sha256 cellar: :any_skip_relocation, sequoia:      "9ff474d93376ea2aa9ca79fe75f9417239b49718c59d82e2282335ae72040819"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "db27bec0abccbe30e393e4b1ab0401439aa86fe6a83f5f735cc87efb32447ba6"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8c78917978c0b1936fc9b1532f37acaae1d1c43ffbba5d944d894279e44035f4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "84b76319b22b54602c1172768a96bb937ea9ca02fc26f8c9afeeb0e0e4e9d406" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cd329c10b3bbf8920f499ac34d2cc79609d6f4c0ff58fc0171969122c32df7d7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.889+e6be5cfe3.tar.xz"
  version "0.17.0-dev.889+e6be5cfe3"
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
