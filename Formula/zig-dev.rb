class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9f9399a7cb75e726a5f3a17e9845a5d8c879d374c067a9e392d3b069364d02f3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bdcee89fdb04ca110bd1b7eed0e0c65f767b71ffb4fd6491fb51218c2134a310" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "604cfb108ceb94cfeefe618fd75d6a3a7850ae7b690307e198ebbd15b0d5f15e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2245+dc6b05408.tar.xz"
  version "0.11.0-dev.2245+dc6b05408"
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
