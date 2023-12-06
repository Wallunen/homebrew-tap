class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ddbae1548eb11970a2927ae6560acd0c6e0030fe256188f966d28788f608b3b7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "53f295a684689434138963105f2c13b76b33e44876ad994b169fdc402892f4b1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ca835f8f0b977d6c25a5125c85265e392b9b8f1a282f4c588712232fcebc9989" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1800+559e216f3.tar.xz"
  version "0.12.0-dev.1800+559e216f3"
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
