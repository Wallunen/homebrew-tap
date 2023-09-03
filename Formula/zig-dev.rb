class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2aba2157ee8d45496969f0f360b9226c72f9875ee10068bf2eb6300cf58d7161" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3abf0d5f7500c9e93ac6224ef063c6abfc6ecf0c1edf94d6bdd22227a98dda2e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a8e7f6e4f82117563b4fc0fac5d65b027a47e505dd1cf7f603aee1f5510d0371" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.256+8b74eae9c.tar.xz"
  version "0.12.0-dev.256+8b74eae9c"
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
