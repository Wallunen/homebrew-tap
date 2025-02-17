class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ff069db5d5ffe5bf833d7b03aae974014781317c64ff22e8a736465746d5c608" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bd45662c7db43bf996233c6a1b314666eb9423128fe7c950d75936eb4a4c1e6e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "07f750842b74e4c59113a74e6da0b0f266900de8b389789f2ab8ded610db2470" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3237+ddff1fa4c.tar.xz"
  version "0.14.0-dev.3237+ddff1fa4c"
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
