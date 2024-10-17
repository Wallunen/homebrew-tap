class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8f7af83d1a047e4e67d0c453ef312bd67e9ee01cc30fbc1fbf8239bd9b97d6d0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "874be625205fc437591c2aa76f7f89f3a9c9a197ff73a3512ef8e0b3c623043d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5c32c578472dbc7eac8a670c0f10d2b32e9085610ca8bc058efac0670c55a4b8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1924+bdd3bc056.tar.xz"
  version "0.14.0-dev.1924+bdd3bc056"
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
