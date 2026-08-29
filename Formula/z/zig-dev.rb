class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260829-133226"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ea9524ec4bbff7694069bd99e67ede6ff40f6cbc5805ee9d2c3b7ff171b3e7c8"
    sha256 cellar: :any_skip_relocation, sequoia:      "4353ab050f7b82a9f554e7cf6573db5a1b26042420b6126def59d08acbe794e2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8c74488c9ef5c18571c42b57871ba417dc20e50ca49111b767192834715ccf28"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "310086ac8b177a32f2b6a2f1b1f742db17a0d346841c57255a47c8b696d8ea44" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "64588edb1a32fdd64e6014d5a21f013a74936e32d7196a1afb48df8d61803419" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "122e91695d3dd7a7b640dac7f901a09a900614ef01e936c9f517dae8299b4368" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1933+e19a73c2d.tar.xz"
  version "0.17.0-dev.1933+e19a73c2d"
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
