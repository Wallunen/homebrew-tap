class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d283c90126dfe635354fee218e81050f1450c05645903d18c5ced0a9eb447377" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5beb17e2fd67b5b281f4c1a0c66dad32a15c29fc424049c0668f37184fd108a7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f684680e2d0ea395805690f4ed0ce989cdd7398d71806b8f98c3fb23cd898368" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1076+78fb9c0a1.tar.xz"
  version "0.14.0-dev.1076+78fb9c0a1"
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
