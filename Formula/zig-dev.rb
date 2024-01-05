class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0848db89f4aa4f405746daaf7d3ec850b24d7a4665d5f821f742661ab4894539" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e68ad82c67984835bd91268a978a3e36e72d4a22d5027c18daeb0ab598f02f4e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4d8bffa359da6cb983a23686197318ecacbdf6b4a846fd4619fa2209101fb0d2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2043+6ebeb85ab.tar.xz"
  version "0.12.0-dev.2043+6ebeb85ab"
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
