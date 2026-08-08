class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260807-022331"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "98ea8269116ca721e7b57191234d58915d70225ed17f1c814fcbc940409b350a"
    sha256 cellar: :any_skip_relocation, sequoia:      "abb1ca78834e683b6d89137922e6277bb75affcdda0e8ad3a70548c0e587e4a3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e82fc2cc7d8be64b2f4d72672920c1bdca061b0962f539922e6586af4c587b7d"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "eab2350d8f09504ce0a12dc38ec4f7690a0accd16df030327e37bd4a884f9aeb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7b1e292828d33c4f1fc2ca042c84b6bd980b56e0fb638f31f111809d243d728e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "be19b234c47af01f0333fcb7212a59840c2ba3531ed9374cd79b3695c48a66c9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1609+11e2bb391.tar.xz"
  version "0.17.0-dev.1609+11e2bb391"
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
