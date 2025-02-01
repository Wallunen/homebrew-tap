class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a9cb03eb533b596ee12c2a239b19e5b3f1fb0eb4ba19b101bcf1494c7c7c738e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "52c4ac284332e00bbacec7bdc601a186af4449d6cd915fd6a4cbf4898a7db6b2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e2544ee01d2a43a0c66b0ab6588c48ac7d7ce819108a3d6af1ba16897567c87b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3011+e4c049e41.tar.xz"
  version "0.14.0-dev.3011+e4c049e41"
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
