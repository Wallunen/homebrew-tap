class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4d5df135e403af79b3449d48e8538246d4fbe8bbea09a387e0c38af8837abf58" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6faeac9c6a1a56e6a9f4b6bc88e7dc02fd29909b0dc3f36a320e1b7367d7d3ee" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "56e4c4f767b41027af32c81f5fa6b97afe5ddd9fb1cdbd52da334967cfa6cce7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.175+790b8428a.tar.xz"
  version "0.14.0-dev.175+790b8428a"
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
