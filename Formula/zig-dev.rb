class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b5349b2852bcff12619393794221b3d1b596ab44bb39e7ab894fa12f2ef9832f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2f5d70e1570d14c708928b71f2b8649be5af089c95949499f5aa26d07003d368" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a8c9c1bc9c46c59e70505a89ab33ad9f893b6bd84675deebfe4c0d283503ddeb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1631+359842f8d.tar.xz"
  version "0.12.0-dev.1631+359842f8d"
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
