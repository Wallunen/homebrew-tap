class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "23bb9b2f4df2398da4b781af8a0eee96d4e3147cb08b931264510c802e39f3aa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8b1a6b450d6eee8aad2dac33dcfe0299c2bb276849ed47d208669b110069d2ab" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4da1abde377032ae292d12cd9b73d930fb534389fe62a1881432d328b785f209" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.357+db75a8781.tar.xz"
  version "0.13.0-dev.357+db75a8781"
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
