class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d800aa73f8d8fc296fcc629077bad806bea3dc6aefc828cd2bea2dd6706542cb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "86cdd138568e5846a1f2a9fe3e930540b01d976cf03580e34e86ffdb0626c2b4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c080f571d8265f8c4c5c28de65d51c16d3a8065364db79e06504f987e82fddff" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.6+0ba64e9ce.tar.xz"
  version "0.14.0-dev.6+0ba64e9ce"
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
