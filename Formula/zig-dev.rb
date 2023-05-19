class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2a5a0c601813719a5b72d1a1d8c11beeb54cf082c3fbc9ac272a3b28b7f971ed" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f44d8883ce7074d170a163963b9a12be8edce7a8e074430e7dc08d53cd06bd73" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "83071046f77c99b9b333c1ed4c4f5265e29d252914a380d277c87f772fa839a6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3206+b9d2e0e30.tar.xz"
  version "0.11.0-dev.3206+b9d2e0e30"
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
