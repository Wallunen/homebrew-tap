class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6cac51e26606aa9921b8718cf318c1bbdbb4141057c3051de3b190e7b0d89cb6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8380234cf49210ccbad36b24bff29c323fe431f57bd22efc45bbb2d3bfd8239d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a0015b6664911e7a4c69ab62b9a913ca5d0e3ebbe1646814202e2ace9004da66" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1396+f6de3ec96.tar.xz"
  version "0.12.0-dev.1396+f6de3ec96"
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
