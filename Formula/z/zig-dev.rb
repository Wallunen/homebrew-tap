class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6aa737c3a0fc9bc7c825dea9bd38d101bb387382b099df4b27e0a6bbc511a4b3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c997c93eedb391d38d9d851df802f1d1366a9281f76a81019c354f74ac47d3c1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b3087179b3d3325145d0c8101d5bba5e92aab2a4533d10ef0b8d83478c95fa53" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1991+33d07f4b6.tar.xz"
  version "0.14.0-dev.1991+33d07f4b6"
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
