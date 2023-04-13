class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8defa9bd52260faf9014cbf526efee4e28b0bec85b9eb49f4063be5fc278638c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a7db295d4b63087f2fbaef42540ff1c9c9b0d8a2e11489014d9a90561509e1e4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4447534d45a59bb73e82ba71fc1988524917cf929c9d15a58e64b78d8c2d2ac2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2563+35f9c8444.tar.xz"
  version "0.11.0-dev.2563+35f9c8444"
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
