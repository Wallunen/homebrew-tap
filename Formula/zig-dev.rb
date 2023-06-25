class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7ed73b4e388683b14ba84721058d2ab7baa1dd2baf7c01d19a1da6773068614d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6d295cc4dd96a2b42c30d8be7c38128f7880c5a807223d5499b2fa5995077aaf" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c234c863637865b6d2d8416685f4fef69d602f3eaa9813055e443f5863fc7ecc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3803+7ad104227.tar.xz"
  version "0.11.0-dev.3803+7ad104227"
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
