class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d3c8d361e7e323dd7bde83b966e6d2d490ff8af98f8a57e6eea12d452aa9c48d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fe0f3937b6a01782d13a8733eb69b4e1aed724965081934c14a3c4dba3ece3f3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ba2b76a160f86cfa5a72f0e5e99d017bef5f69ec8dce7161f53d71574b569989" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2238+1db8cade5.tar.xz"
  version "0.14.0-dev.2238+1db8cade5"
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
