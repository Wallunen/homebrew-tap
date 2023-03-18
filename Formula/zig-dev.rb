class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f74743925d81eec864dd6086a43745bf18aee685ad469deac8c8868039a9717d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7811b8caf380dc324664b2829ec15f94ea105b8caeba50d2d59ad04e27b0754b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2a150933d52203562ace4e2d4eb2844527f6f2b2142507be10c5440892859d41" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2157+f56f3c582.tar.xz"
  version "0.11.0-dev.2157+f56f3c582"
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
