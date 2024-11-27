class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "773e5968f8c1febecf048c15765a311378fa36a09d01ea47f920a9a95de94702" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bba09423d18c94dd554ea3336c4806891e4e0aa2eb8964078be27cd453bdeddc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "38c7bbe119da0f9cf12bfe5842849651fccf1d59a7f0a5b16c694eaaefaaa599" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2316+68b3f5086.tar.xz"
  version "0.14.0-dev.2316+68b3f5086"
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
