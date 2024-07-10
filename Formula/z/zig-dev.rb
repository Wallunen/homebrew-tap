class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "18db06225ba2e66d7b337a13b547fddbee873f14bb52591112e64f4df583b181" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "423dc514840e45697b49c88b3e1b2e71d47d1526d6d1af25321260eb34482905" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "90debb9d61cabf269c6bba2b6ab125933e3e3a536f589c56192520954dcea151" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.218+b3b923e51.tar.xz"
  version "0.14.0-dev.218+b3b923e51"
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
