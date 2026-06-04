class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260604-033118"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "291db658f654843f78736e1c67e17e9830fde3428e1655d1e545fceb01df059f"
    sha256 cellar: :any_skip_relocation, sequoia:      "1c328e583660e877120fcfc0970305a79f3dc2942f7fdc2ae50a6ad738c73e23"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9c115acac60bc080d0966dbdfa1662665c3a136b7694cf548fe577b6925923d3"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b95fdaa14d2af28a3cdcc45a74cbd82df46d1782b99b2aec541fd32576e35055" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5f27f1ad379760f8ab0946f8f4a2c4ea03b5343313f03eef5b3c984853065703" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "14744d5834b9c903b6a869afbe08c478ea61a01414b4d3c4a966c2b1fcdc28b7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.690+c5a61e899.tar.xz"
  version "0.17.0-dev.690+c5a61e899"
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
