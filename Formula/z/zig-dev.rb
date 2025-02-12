class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8fd02b5418a06e2014e8f58b34912fdc065785b5b08aba8dc103f6c6670500b1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a36eff2f714bbace3e52e0bee3be1d081a668df54946ece8a94d7a5d558d3f6c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a3bd9fa0f9159ae95455cda2529ca7575c3323ffb687f4a8d5ce3c9594172314" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3197+1d8857bbe.tar.xz"
  version "0.14.0-dev.3197+1d8857bbe"
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
