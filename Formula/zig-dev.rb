class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7591eb49970e953dabbdce07032d00065dfd6c422ebd020bd897f00b618e4b4f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9566cac255b686b4c7a283a0146a00abec5b6b893d2e7364e22b7218f7abf445" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1b386dda678f250d9288e26d80c9b451a06d4225241bd4e47d87b8588d6f9be1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3652+f5043ad6a.tar.xz"
  version "0.11.0-dev.3652+f5043ad6a"
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
