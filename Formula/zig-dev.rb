class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9fe21c92246629dad2c13aa8a26193e60fcaf6492777308b5ac1368687b9cd4c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e8b6f51d75e2dc9e6419578173f7f530d77c208338b7e822ec903b222c99555a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "be0edc922864709565f22e7b86648aacb3308dca171f776e3e7f049f382d7608" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3052+4e2570baa.tar.xz"
  version "0.12.0-dev.3052+4e2570baa"
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
