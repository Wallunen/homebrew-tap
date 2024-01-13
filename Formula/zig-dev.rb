class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3a96a19475b035327ce3c5175d30329efa78ba97bb0209e3a4be4387ddb2d257" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e091229f9e6a3122e945e3a695be1f8d7c5315c48c66028b190c63ae3b0691ad" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fdc20684833e548933f16caf2d2d77dcfdd24a82d39ed8a6bfb90df4f8bc26ae" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2154+e5dc9b1d0.tar.xz"
  version "0.12.0-dev.2154+e5dc9b1d0"
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
