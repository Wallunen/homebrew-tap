class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "016559890450293366064975700f5ae4aeffd6d73ef3191ed038cfef02606006" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "005304d2a544ece7e35d678af348a7f9862c81ac83026bd6ba497699e236d74e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6cddc1d6dcf1c1f3ae81c9ae82884c15051fe940c9c4e823bfb30fcf0e6d8f13" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.234+ae44e199a.tar.xz"
  version "0.13.0-dev.234+ae44e199a"
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
