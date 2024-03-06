class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9e2fe52231fbd95f6abf97898e6d3c8da411672263ac9d52ff4b49545ad79a97" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4e8686ff17b1facb76ce846e699a3b7ebf4a96205d055f48b2dd2ffbf9ea4d88" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "baf4879ac028b225bab4e7e3fbdc9c25f02066794d10a64232c3b67257f52148" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3158+1e67f5021.tar.xz"
  version "0.12.0-dev.3158+1e67f5021"
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
