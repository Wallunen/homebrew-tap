class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0a8d107ab6bf5cdd48302bacb09bbb3f8dfca5a0b669d46ccea43bbcf9ce68cb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4af3b322cd25be8c6f828617185f9504384c3b8f8e770585fe1e8702470fdb3e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3d04ab30719fac80a01579587e4398734112205425802840b20f02d893485fed" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3188+34644511b.tar.xz"
  version "0.14.0-dev.3188+34644511b"
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
