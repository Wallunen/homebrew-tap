class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0a7d1f8d5eb8b16c03993251719f716b72df62a09dfe305bf13c8f68c0d50834" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bc0248c640a4c70a35417d856989146bc5ead39f07537b813d90513a173962ea" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d24a6d6fb8c6675c72af47486e40bbdda2ec357f1b5791e9e005cd31f0344fe9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3659+1e5075f81.tar.xz"
  version "0.12.0-dev.3659+1e5075f81"
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
