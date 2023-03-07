class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3c24d8cd34065766a563009cc01ac7234675e25de66a5f76349c1e0ce1927497" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "51e8db0c3ee7f8cd83f7f90f7a6293684b538ddd54b6467e0693b43162719213" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "23d0a75279be5a73c277b975f750806db9417d3b44dfcce0ddf983356861ba31" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1893+277015960.tar.xz"
  version "0.11.0-dev.1893+277015960"
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
