class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d3c7d549668f27da68d916699e1f6b06623855ca07c4c57ad4188f96b4303301" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7bd291fec8e22b7ceb1c228f00deea545ab44bec59bd23a35e9ddbf490a3d538" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "367857771b584406ce76112705af80db35285106bbcd0c04f4347671d0d5608e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1391+e084c46ed.tar.xz"
  version "0.14.0-dev.1391+e084c46ed"
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
