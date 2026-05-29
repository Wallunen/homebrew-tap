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
      sha256 "3a43e877f1a2a6e4ed7e9135da1be83334d938701b1a37ed55c8ee84a5bd29f7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7e230c59fc07b70ba50ee432481afd65f75b6386d4f74c71704d4eeca55c21c4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a4e3053460b27e879b728e0a21e2951c53036f71e15bb456097f299653909712" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.420+8086ae176.tar.xz"
  version "0.17.0-dev.420+8086ae176"
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
