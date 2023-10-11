class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9c69e0716d33517342d636df3627debfbaf875cfe7e5a85965e00708a1ac672d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "26794a48bf4b3330d22a039b01614705bfbccfefda493eecfba8ef06b5329600" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "272a8af3f416357cdf349181abe0954a6094efb4a1ec04699e9a541b6be2097c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.876+aaf46187a.tar.xz"
  version "0.12.0-dev.876+aaf46187a"
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
