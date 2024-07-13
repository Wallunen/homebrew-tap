class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6087e2f5af43f77d7be4d8662dadfa0c4055a4e504bf852b0507c043bc0f95c7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9204c6991258f697ae150d57cb2c5cbe21d250c31082d5c9bc62d15a1471317b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b5aef72b3563aeeb18910f8091e8dce18d1244520dd74827484a637595df3052" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.244+0d79aa017.tar.xz"
  version "0.14.0-dev.244+0d79aa017"
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
