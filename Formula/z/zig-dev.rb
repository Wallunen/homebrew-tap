class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260914-143907"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "98f3b9424d7136678f401c349030d42b84b5eae28470280b67c24a90560ae0fc"
    sha256 cellar: :any_skip_relocation, sequoia:      "00d54a719dddf085fdd60bf1b6ab7024fc876bc3d2f0c78d393c3ba4241b7be5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b0840dd6b9778b5f63d8a82ea04067ba1ded4f5e02693851e7199a6d4307224e"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f392f377b1f7dc2dc37a340dde70da859e084b1db547f9572125c4e6d6844586" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d35a8112888551ab13c818298cbb101a4a958e89bfe5234a7bc26321fb0e7efb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6393818b7e318bd4ffa345a736a092d780df9ba257b2e7b56cd6366a7a40584b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2151+2ec5523d5.tar.xz"
  version "0.17.0-dev.2151+2ec5523d5"
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
