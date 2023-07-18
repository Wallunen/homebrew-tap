class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ceaea5428c3f85616130759e1d500ad29baeebf6e36d12a4473bff4237ebf5c8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6f15bb53796b76e18e7a7fc54cfc74c9cde8fb73a4a2aaf8a511d9b6c4d93643" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2a59a61de66ff3817f91828a0e9a116036fa091713d29f65a1730aaa3a272dbe" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4006+bf827d0b5.tar.xz"
  version "0.11.0-dev.4006+bf827d0b5"
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
