class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0ea6c7205083e1089a33e33efdf9ee131c0948b8638360103570b9d3561ed479" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5896cc3d231b6dfa0df2ae2584fa8f6c3f91f8c384e526f1e17a5305565fc0e4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3d5739a9e2dacfb17335e3851222db0ceb7403ecbdc99396c09598ba1e04027a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.935+a1e0b9979.tar.xz"
  version "0.12.0-dev.935+a1e0b9979"
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
