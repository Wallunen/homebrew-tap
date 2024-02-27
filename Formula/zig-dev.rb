class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ceea53817615ad40d3a6732062284e1f9e569d1edb37e3dc29a123973309efd8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fad488ff447fcc67c6d8972fbf50125aff567b6f6d765e6644daf161988278d2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6449698655d085897b5a2a01639b83ecd57a13f626183446e8012e5eda72a631" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3033+031f23117.tar.xz"
  version "0.12.0-dev.3033+031f23117"
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
