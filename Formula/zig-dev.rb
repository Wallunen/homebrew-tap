class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8ba2f72d6da70bbda65f48e40de4a8f457e06c5a41710d0a0ce8304efc8883bd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b014b772b40009aec19af272b9518622389dc3f2e70e7d8c4538e37c6a7bf156" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6060c64839dd0197675f926469b5310cf730cc105785a7415472d273e6ff250b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3541+05b185811.tar.xz"
  version "0.12.0-dev.3541+05b185811"
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
