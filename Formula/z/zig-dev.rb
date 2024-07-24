class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "91ad57400822cc98afb3f5ff480ad4308c0982191936a4173d869ed3167ca0e5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dc077057745bc33f0f6cd657caa867e4633c462f8683c5d747148ec6691511f2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3d904c5ad3b9b46cd8a398220b9f4bbf45e139403fa24a4597e95ab430541317" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.541+2e8acdf6f.tar.xz"
  version "0.14.0-dev.541+2e8acdf6f"
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
