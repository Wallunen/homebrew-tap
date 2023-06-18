class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8e406a9607ed21d9b224a41a62fb1662dbe11e29fc13558c478b61bf4baea2d8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8b6b887999e1516922b83b3dbfe107575a6846b9384b272c8e78a0fd473b9f9d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fbf1961a689c9ab89f4c73c695005e91f232c2ab0005e2e6e3a516571f70b1fe" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3677+e95fc2023.tar.xz"
  version "0.11.0-dev.3677+e95fc2023"
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
