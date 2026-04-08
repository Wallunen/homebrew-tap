class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260407-165131"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1d996ca59630c4daab63b0eb150bf743b91935909fb9ae5e47d284b045d5eab1"
    sha256 cellar: :any_skip_relocation, sequoia:      "76db929937a765b72bc01d6384b26e249b000ca807bee90d9075295d9695ea45"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6090a9699610474835a0d644283a933ef727c380d3c65eeb61a416b8928b7698"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e79344772a7db3132cff50d3fcc37636a0ebab0bef571df313cede9faeaf00ab" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a997508001d8fb69546c002130df62c74d1e7630a49ad67ab0f9e1a0e8d877b6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4328c8d07bedb22c331721a570992fe4a8b0af795eeed670bdc27a49bde032ff" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3133+5ec8e45f3.tar.xz"
  version "0.16.0-dev.3133+5ec8e45f3"
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
