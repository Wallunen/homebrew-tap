class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "72c130d1bf94fd0889ec3de8033e02f12848030bb30b814294938bc7bad7c3d3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "180b6929f67a0045f522e7c23aded47bd32b59c5cc8de3d69a289573a8823e3f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2b2aa55fd5eda156c74ad6c45caaf922955d6776c9fe6fb1132d9c6f14369be4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1472+3929cac15.tar.xz"
  version "0.14.0-dev.1472+3929cac15"
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
