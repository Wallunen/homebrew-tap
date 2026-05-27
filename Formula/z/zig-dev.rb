class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260527-182124"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c79b844e97c60f94d3f57a28d11fffb315ef2720fbb2c7a698a2be20dd840bfa"
    sha256 cellar: :any_skip_relocation, sequoia:      "d8de3829632c3913b041c26acb2083b35f1e56912b18dceca8989c08084e837a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5fa595ad7b521d8087219bbc439c7e21b39c7bdc8b84003a825b2c31347ad0ae"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4c7e66f86e7da1faa7b8d1121b73d08fabb9c7859cc5a9201843a8a61b8deb0c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fbcd8ea6c710869b16c413ebac840c5e2f95a97eeecc956ecf0a552ba346f4fd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f5cbe4a5ee819a511176f6ea352c9ea355d7babb4dc74cb17172386473025683" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.389+f5a1968f6.tar.xz"
  version "0.17.0-dev.389+f5a1968f6"
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
