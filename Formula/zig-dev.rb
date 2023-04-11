class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e8d123ab2694bdf8d1274e08d9f9a333cb706d63faf9d20bbaafa1780ee98b37" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cb5d477af24c6dca406f718a12941105f2104bb1e94e4950163ea19ddea3e840" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ad7f08b9f0c666120ee59b7273f73e837584733dbba00909ffbe01678657d2f4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2531+aeae71f46.tar.xz"
  version "0.11.0-dev.2531+aeae71f46"
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
