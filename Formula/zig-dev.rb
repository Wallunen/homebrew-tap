class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "877ece87898e95fec4b8f16ac9064b718c7a4080fe3cd780582675fdc59559bc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9a24125fee84549fe817891175daf57bc517fd7304aa15c567b5caed7932159d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a66d124eb6179811d8e4a54830cd1e301a88bb06d4ef7f351db2bddce1f61233" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3944+2e424e019.tar.xz"
  version "0.11.0-dev.3944+2e424e019"
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
