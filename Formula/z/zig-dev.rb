class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d7b514cbbdaffe37cf76d9c26f5bc7f991d59e8734368c420aa2fa420ba856cd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1c94883892d40cec7f25cad3a276326485ea061d42f8420ff332d9b3cc5ae9e6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b4bcd618c400831dba8e71e888b9db27b130d04cc5f5b7debf374e9a574ed974" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1294+df6907f60.tar.xz"
  version "0.14.0-dev.1294+df6907f60"
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
