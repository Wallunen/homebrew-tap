class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7c42bf719aa50b1c9eb1328d89ca198a75dc68c46174af6e0eb549c1d3724ef8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9c35dac988524b821035295ef90e13f1dc43c97946c80a54c952ebbe5ffaab07" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9a230a150256af97e8dca598f4f8ed57173e24d86450287689f2e85938fd1d2c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1420+e5ee9c1e4.tar.xz"
  version "0.14.0-dev.1420+e5ee9c1e4"
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
