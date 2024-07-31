class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "881141bb45de95ca6a0c17896349773dc470fd2b3d50b44c169592c326697907" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8a30fba17302dc46b9907fbe2fb2543822695633b6a9299eeead6492ff94cf16" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "14d566768ff2ecb44cff6e9d35b5115503ee1437e5eeba2c8a3be111bfc8c0e5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.737+30b4a87db.tar.xz"
  version "0.14.0-dev.737+30b4a87db"
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
