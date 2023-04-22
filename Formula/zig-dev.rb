class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "380830dffc1dfa9564d150ff531e72d4d4789db9eccdc121ae6817cf2d6a9502" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "49d0da5d0ed7efdec413e7494983ece7b5c1feb344b6156c0ead5f91650e2b90" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "862d1d6a04c3608768c70af0d864ac651151b781f17b0a58e2ccebc0769e1b5a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2689+b7c00999b.tar.xz"
  version "0.11.0-dev.2689+b7c00999b"
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
