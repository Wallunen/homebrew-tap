class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "abce77dbad35fbc5d7d0b7da5c4bc6db7c76fda0930c85f5804c8c851ab0726a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ec79e14ba5af007ca2d2b54d89e0c778c87f040158a61be14b11cd445c1def20" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0498aa4bd13c15b6b1203241af0ef3978f626e94ee76d5f059bce796beb91710" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.288+9126852ba.tar.xz"
  version "0.12.0-dev.288+9126852ba"
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
