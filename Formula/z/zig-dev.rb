class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0fdc669f840d1190c32785ff75f7622db59664631cb723ecbe8ab9adcf4531ad" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "950bc76d527e95c912aa5bbc8dfe1d2b9a9f84beb877e7ba7b3025bedd4c506e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a23648ee3b436e1631c60f11a07276dd1717a39572ab46c826518798685ae138" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1550+4fba7336a.tar.xz"
  version "0.14.0-dev.1550+4fba7336a"
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
