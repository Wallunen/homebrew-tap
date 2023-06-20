class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "62073f8495c5e4dff6dc827276f92b76699df36dd74017b65c1bb5b0fffcecf0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ece7178fda9c8a6e7496f2162c2bcf75b79bc7ff1b22f5b90b1b8b7b6b007312" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "69428c03e76b7911ab55d8ada9a1a91bf55b2a37f437eda641e323218d34da17" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3723+423d7b848.tar.xz"
  version "0.11.0-dev.3723+423d7b848"
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
