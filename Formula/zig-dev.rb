class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e87c5fc02e797fed5c96fffaad72aa6ffb89aa27c0a16380293ba42d6e4bb422" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d14a974698ef8a7f83dbc20e6658da0647ebcc31026898bf7e447d881aef7e5b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2369abb8dd828029f26e2c93bd1b7fa63d0180e2f603025dcac401eec7e7d027" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3857+7322aa118.tar.xz"
  version "0.11.0-dev.3857+7322aa118"
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
