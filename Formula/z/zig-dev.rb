class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260717-020844"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8fc8e5efe7498dd9c744fa60722a9548c8d15d19bc4b898d3fde236339924aca"
    sha256 cellar: :any_skip_relocation, sequoia:      "6f45ffba169d1820fc4a10639f9b549a7b30074209a1393b8e624b599367cfd0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f73657323c50a8b844e8af25a1ca8bb41aad5429c9011f879aa5c309f2059c12"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "42c4f209d40c0da3c361a0daa2abcfd4220ccb545bfc75ab0ad10aea481f2370" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c511786f75edf53e41aa274a7a0f801112f80636ec94d4db122fb153d0fae8c2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "db27c15cbb979760a5e31cc10c451f27b2c79c02560776ae3f831161584b099d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1415+64dfaa568.tar.xz"
  version "0.17.0-dev.1415+64dfaa568"
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
