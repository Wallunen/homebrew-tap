class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "83f458894bf6036a9ef16d791bd5da946f6faa537cd273aa959779d62ce2bf0a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d2127c5908c4d982e8639faf238696d658c7a6649e54f041f7be8eb1768b4775" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cfc57b9a3dac99f10edfc5f74d4b038ff8f161e733f46025c7d682d5d39258b8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.53+fda2458f6.tar.xz"
  version "0.14.0-dev.53+fda2458f6"
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
