class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "70df0335f2c3b359bef80257cc6b4ffb579ed554928455e2dacd09ce215256e5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4722e8602c19f1c09d6482301e8313c4592d44ab20e34ab634d2156c25b5ab34" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3d49e57b8417bcce69b63e7aa71b44bcaf69e1f496bcaf208f45a8e44811f988" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2302+b729a3f00.tar.xz"
  version "0.12.0-dev.2302+b729a3f00"
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
