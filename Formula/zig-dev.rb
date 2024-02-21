class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5a3dd0af75f64e5c77e43a0537cd749140b03462a20dd30e7760499e4afbcbb4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fd103290bf0dcb558ef71dfac3711920eecc25224f3c6df77ec0c3849345aeba" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e19f82829fc7653de2fe64523986797a084520a93feb7f4df117c376c09dbcd9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2818+97290e0bf.tar.xz"
  version "0.12.0-dev.2818+97290e0bf"
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
