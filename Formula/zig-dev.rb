class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b0e23fb3b85b6075b1d2f2c44a608a920c12f139502bb062c8d7e4106ada848d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1119cecb3886ac9d241f3692ee5631e0a6193fa83ba57460c5d69891f84a1762" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f779a6bf735fbc3168b60c385133b1ddcc480adbd25c4fe1b611c37848e7cb19" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2296+46d592e48.tar.xz"
  version "0.12.0-dev.2296+46d592e48"
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
