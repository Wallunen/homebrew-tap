class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6687fdea5da7999c19afdde847401e4f6b69b8f10042c590a40b01bf1175ba20" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8a6e3e2f4478f674feddfc75e94b21045bab756fb17464b84399515416264c3b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e70085cb1044e7fcfcce3d7bb3b4804a8c6de06a1131f51d91999fbc60930492" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.170+750998eef.tar.xz"
  version "0.12.0-dev.170+750998eef"
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
