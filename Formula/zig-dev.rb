class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5bd448b9d1656f7ad1076186fb3b70ccf5f63110ee07ac5203faef0f1968aa78" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c2093524706f93fdbd20d9206270a6717ba06d322d35aef74407dde1fdf42b56" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "49d691d172b842c0b8075cb6bab02169730cea20995b2900487003a260fd3c7f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.92+fdce18cd3.tar.xz"
  version "0.12.0-dev.92+fdce18cd3"
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
