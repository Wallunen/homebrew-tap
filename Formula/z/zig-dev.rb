class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2601ef75b27273309970a9fe74ae7dfebe5d3d94c277629f9bda0044df143742" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "45f32fba3ee44bc5c41508c443bf165209171f8b71f56760d82760d88be5cf42" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "35b5c98e18e9d8c4d9bd3415cfc4b8853dddcd68997df4f217a6039ee65e59d0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2077+c39ba682e.tar.xz"
  version "0.14.0-dev.2077+c39ba682e"
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
