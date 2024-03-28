class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "da927c7085963aac33407e7c2ef1fa9e8203cf53f408ec546131a82122059511" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c710590fea030f5ba8901da83d49f3b11ad4d7291f9843142aab65f67a0d5a74" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "10d5b38de9f08fac524ab66be6220055ef70a8f367d307d7411cec00daece6b8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3475+71d878ba5.tar.xz"
  version "0.12.0-dev.3475+71d878ba5"
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
