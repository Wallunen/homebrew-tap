class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0ccd282fe9144de088e632498876de2ed0309977f9f9dd084e7ec96df65072bf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ddc08088d32214d43e986fa3f63a549115bea1780db5c3b83dc6ca7fe78b9bcc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0b5d8a0148796342ca3883419d30f570b5c8a179dbc918e8fb5332e9e15b7f2c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1767+1e42a3de8.tar.xz"
  version "0.12.0-dev.1767+1e42a3de8"
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
