class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "38c83b2534743b36e2c991643e0d3f8ec1689ea199b980673457a616c5df351b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c398e67d01de3f124061fb6f308b1b4fe310cf3a7f3190c3d1557ad0f36b60d0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "40a90e60ff469bd0eac19dd733dc31a92dd499c782bf7badfe2ff0ba3701cfbe" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2579+021289a65.tar.xz"
  version "0.14.0-dev.2579+021289a65"
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
