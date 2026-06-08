class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260608-182143"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4c1f6efe2eaf8765254b8ca2204c0dfc6f5d3ff675928bfacc935d46a55f8b54"
    sha256 cellar: :any_skip_relocation, sequoia:      "3eed9a938c1e378da1aa91220a0f695a3ee2c204cf4483f6355380fa4d13a1f1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8bf5aa7cd4af7557269b648fd945faed830d424c9ef979ec5247412e9ca38004"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3938c46ae4bca3c13f423b09503e3ef00bb4b7ef12b8bc1e5122ede366057a5b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "36673d2513afa4a96c86780648ba504beedd7f0451389091cf9d53e38d5b4840" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b0d46ffc4587b9e8dd0b524ee5bc4da1e67f28bba55e7c534cec64af2f2d7a74" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.813+2153f8143.tar.xz"
  version "0.17.0-dev.813+2153f8143"
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
