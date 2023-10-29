class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2c59ef0fbea076ccdeec1c13823d7c4b1034840c0eaeedef5d2e10780ff7e944" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "996123e46059f7dcb414e44e82b4560488f603ed3a07e1834d9527ba2e7b19c0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "05d7d9b1f06bd06333251d150003ed1637b5b30f25864fe96a27c5bf536d736a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1326+9ff9ea38e.tar.xz"
  version "0.12.0-dev.1326+9ff9ea38e"
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
