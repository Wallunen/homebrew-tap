class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1b9ff9d69685775a541a7918172c16141e7cdc6832be5e48055e18d8936eebfa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8c64018678b7eda3cef0ac9468ece58e22457edae02ebf443b524546aab56b46" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "62e85fc9baf1a13250b33ec343c999db0f5c3b407e40b34d1e39ab76a1c61558" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1307+849c31a6c.tar.xz"
  version "0.14.0-dev.1307+849c31a6c"
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
