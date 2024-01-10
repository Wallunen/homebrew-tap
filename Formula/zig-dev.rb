class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "529aa36e3c902b865de0184945a90995dfaab9dfe1361ebe08cd18b56b731328" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3b9a7d4696445cfe3e92c51174d1a3e3c51afc65c41ded1e8b7f65df763966f0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "42d0ebd64a127b790c75c10bdfa0454c9cf0774b972e261adad6cc61cd8665f2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2127+fcc0c5ddc.tar.xz"
  version "0.12.0-dev.2127+fcc0c5ddc"
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
