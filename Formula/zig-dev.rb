class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2c86082501f0c0b3bc84d50e608039f58aed3b42c4b6f991c43bb2a2422d306a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1d6eac7c63812d19db7d2f60ca486e61380b9e353f4ca4816c10f2104339fc30" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3f7fd9babdcede2a260dd4c8550f2beb502c86e7bb6d3f2da380a9b69aa3cc7e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4054+cec1e973b.tar.xz"
  version "0.11.0-dev.4054+cec1e973b"
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
