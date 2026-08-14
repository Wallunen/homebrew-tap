class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260814-012414"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e99ba08c40c019b84c836adad90de6350b5d392d19ff6b7efb82df8ec0a9e283"
    sha256 cellar: :any_skip_relocation, sequoia:      "f11006674f360bdbe3a487e1e2ca794b211d33c4827af802bafe914909f8ded1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7c8a051737e3c1ed92767260b964d37b9bc5b288b4846a5cd6f8582e14b18dc5"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4ca038d75307fb3553084f7ff8dd56c3524d0607df71eff7e2afe91ff589493f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4516688bd0a1d78f0fa17e5a8444f5ce86a4323fdd69bd0fa7c06e1855ac6dc6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f707a6c9d3211ae017cb076cd99212a87d44f902d617516555625f1b789e9be9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1745+ac8a8d0c5.tar.xz"
  version "0.17.0-dev.1745+ac8a8d0c5"
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
