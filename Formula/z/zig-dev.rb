class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e646abc7f5672c461a34baba6f38cc53ef0ff4102746448a21d6ad4c30f66a24" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3b8c6f5cac38ca23f2a8cd3b188c7578670e0e944114cd07d60d91e05d6f17a6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fe3df7ce5f8b86bf6d9c904ce6c7254dc1bca4dfbcbe4a1181728929ee449c62" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1579+f3445f8f6.tar.xz"
  version "0.14.0-dev.1579+f3445f8f6"
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
