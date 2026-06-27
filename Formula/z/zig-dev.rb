class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260624-024530"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "16f5b8e41bad8638493d940d2b0f7ac4d596a742489671bcc28f51713405b65a"
    sha256 cellar: :any_skip_relocation, sequoia:      "14e9bd2821b7846c195c5813f0db642970ca9114b69f3dd0ee92411edfd2d8d4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1d312ce26ed8ad90467de1d3aca23193c2affa7a85cb3ed8be9c4bdc2b7cbfa1"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "90bc3bb472a5f3155450c0341a7366e23a068c642a096ef2ff9a07a759261d88" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8dfb7c5f4dbc5db2f98c1725123b269c52bd1f0bae7183b351c025d33788f94a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a4761c05b039f6954e15b7d8aa5f65df7c58ff4ebf2eb3eccd7786430b11145c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.978+a078d55a2.tar.xz"
  version "0.17.0-dev.978+a078d55a2"
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
