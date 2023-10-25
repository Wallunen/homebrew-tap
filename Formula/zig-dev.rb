class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "78840077ca17749988379c36c04e0ba6ce1681e2deb96cbb58543993f64e4867" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e6995641138cf212b23982ea7082f9dc2ffb4e380027af9087d3ab2cf1396e9c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e9bdabdd5917760924d774f02ef3ff6f27531f355e6d0e444dc4ffec2ee4d122" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1253+b798aaf49.tar.xz"
  version "0.12.0-dev.1253+b798aaf49"
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
