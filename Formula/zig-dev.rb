class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5bf1cc7fcc7ed55704c26833a60fc8a54585b77982794d1fee1d231310ea3852" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "35debf4ab1a1e71bd67ca6770b5d89ddffcae08040412595f47e3bcc5d73b728" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f4acad74a6d9c7c9a7983b3b5329aba092fb133d5d5c627a86dace6becd19c54" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3639+9cfac4718.tar.xz"
  version "0.12.0-dev.3639+9cfac4718"
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
