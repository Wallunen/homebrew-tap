class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5173b4a078d166184682ffac58ed257d545a305f194accae827b037bb218ceb6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f0c6af4646958a94fd62c980e6de73ec8d1bd031e7b720614ff56163cd40d225" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "39f156221f9223ccd825e868c08e3e6e1743b7ae98c15dd1105b08a1fe2c0118" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.254+cf3a6fe0f.tar.xz"
  version "0.12.0-dev.254+cf3a6fe0f"
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
