class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f0bb4839c12ab694f3463d500251a83dd48286a6b91fdb85ca2960d81e7de136" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "83cfe5463b866172bb3ac1577fefb0470c6b9c49eb39d880821108519df34e54" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bc1f022eff21f86acafa8eb681659f0f63af31c38fbfd273ea6a2ef36743718e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.676+c37fe4b67.tar.xz"
  version "0.14.0-dev.676+c37fe4b67"
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
