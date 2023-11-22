class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d372f2fc63078cc2b42d8542e0d5ee209c58ae642904eb0d6a86adc5c1c3364b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bf6265582e3de488d397d5a7c2a586058991829dcc7241e10bb4e96d48f7c85c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5b9c76e3302c121f576183c4ee9419c8d0a0f62202ebde8b21ec753a7477272a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1669+c25f2fa56.tar.xz"
  version "0.12.0-dev.1669+c25f2fa56"
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
