class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "30b71ded092e185f891fdade986cd70bbb824d4b550ae215521a844d72e35ffb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c0db503edf463d3a3d5e1c292a2aa5a6f19fca3c0233bed4fea33634eef9bc04" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a79f9e84070001b6a201d21268db78896e601daec8f9429e7af09832e9d30c71" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.297+464537db6.tar.xz"
  version "0.14.0-dev.297+464537db6"
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
