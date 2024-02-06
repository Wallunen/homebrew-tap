class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "38fe27158760afaf1587f6b5ae3b1c3b963173fa4f2899bda7d18a9e73cd782b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f08a907df898f5eb7576ca7ef65e6dc9b0ff4a815ad8ead8de8e63338eb53144" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4cf0fb7d97e2999ce234d6d05e4be05fdd6d5144cbbc2af483f58c76ebda8cac" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2618+39ec3d311.tar.xz"
  version "0.12.0-dev.2618+39ec3d311"
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
