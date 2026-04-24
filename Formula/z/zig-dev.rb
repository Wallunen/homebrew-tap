class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260424-092611"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "fd4049aaf651ff7315c265a05520edcc7f65e7ae5fef30122c48a4a031db8417"
    sha256 cellar: :any_skip_relocation, sequoia:      "2a81a7e53cf315a082459676a4ac7c8ae0dd14d6d24d4f6300c8e53fd7385893"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0711acf2807dbdae53e7609f3e723216f58ae2210ffa54fa07abc2db8dbf2437"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "495785a88e45c93474ea6f0477cd0d219b66cb7cdf7e77075981376962d41d41" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "18fa23d0a97cc9f021b0d5be866b77f67abeadd6d93ba84919757ef4f8a72ca7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3277caf07b1a335c4a6877a464e7bc6cba6fa6888eb53bb9ad557a68d2b92a04" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.93+76174e1bc.tar.xz"
  version "0.17.0-dev.93+76174e1bc"
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
