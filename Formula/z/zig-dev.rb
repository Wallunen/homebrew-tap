class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "34f4abbebf8dff92171aa5efb7c14a6a0e001c9de60cb8a133bda1db45b570aa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "09dabe64547c4d0b0c5f06246498514fdccbdc63931664f0d5f2cbeb2b31c084" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2d67d876de9db977fc0d7784010096e958c082d07dbe9dea4340fa647afeb2e6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1637+8c232922b.tar.xz"
  version "0.14.0-dev.1637+8c232922b"
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
