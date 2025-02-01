class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7cda95b8e0dd55cd014bf3aaef134d094b3bdc819cb1547a73db2163fe1314d3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "504af03ed31bc85f13e2643cf2167e547ce746c56dcefcaf0943eda6ff2fe375" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "330dfb96a7f4400ccd798bb4c4b0e286f885c816c2675b1e1776cd8d95a16fd5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3012+3348478fc.tar.xz"
  version "0.14.0-dev.3012+3348478fc"
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
