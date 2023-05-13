class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "98c5951956c4c8bab0ee22fd6cbad2f05cdca59b54c3cd92781c4e14f29e4f89" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c1a264adb111f028861e5e57dfe82400511194ca83895b46ede19a80efc1973e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e781031b59e2ad838a35687d5b9d2b7bc4b59f8fea371258ce8e1cde3acd5d8d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3106+3062f9b02.tar.xz"
  version "0.11.0-dev.3106+3062f9b02"
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
