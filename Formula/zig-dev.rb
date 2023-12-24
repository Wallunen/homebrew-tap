class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "81f1ebac0433b97d55d3daa3b52ed87d400bc4817c85e08ab2fb74df7768bca4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5018aa5d23f9ac6d390bde38534cee44e6efe3536150ec45d594c1679d189525" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "52edf713fd4fe88706ddf5d5fbe21a7531a2ee9aabfd80ea6a95c7719e29139a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1849+bb0f7d55e.tar.xz"
  version "0.12.0-dev.1849+bb0f7d55e"
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
