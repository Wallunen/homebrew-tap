class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "be2e323a37bc1af2d46d5dc1fe34e170764304d038681a32647982f9061665ee" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d7031754c2f626923b1cd12ee52f701d85470089e7c80a642dbb93cc1b00867f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d6213902dc04ca4110afeaf160d92c2b045a7cd6fef257a8ad720b94cc5ba4ea" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4217+e8fa19960.tar.xz"
  version "0.11.0-dev.4217+e8fa19960"
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
