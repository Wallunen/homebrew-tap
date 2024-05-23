class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ee790cf92228d4318400f35d7dd61a5ecb5d019f80c48124915de55c7f96fe51" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1a4b324ad354b6df21bef6757ad25fc8a5689f508a4d7ca45e7840a47a7a72ae" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "27fe6a4d2a3d07649f9d07ceb2e384d01ee38aa135b66c37bd53f952f33735a2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.245+5fe9f88b1.tar.xz"
  version "0.13.0-dev.245+5fe9f88b1"
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
