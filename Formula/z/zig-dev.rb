class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260805-102852"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c53711de38ac5a9f4b9826eb69b164e80420b5fccf10d716d9392f1a18a1c6f3"
    sha256 cellar: :any_skip_relocation, sequoia:      "29fe3f207cbc663b1326b2d0b379979e97489954a5a68541e0ae908b54205df0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a399a7f1b51cbfb6a907d92e5041e2a7ca63163292c79e1f3af6747c6dbe3ffe"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5312f27941fb6c3b650608517ff9998cb2ff566d36b0868288d99253da373734" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5df52e88cf12224969e0f7314d3c77a598b4eeb6b559df54781eef38d77a29ba" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "337b81a6e89e8289d31311fd7cfdd53c8bfcb1b8c4b5cfadf3363eabfb9a6daa" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1567+f0354179a.tar.xz"
  version "0.17.0-dev.1567+f0354179a"
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
