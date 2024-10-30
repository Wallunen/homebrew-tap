class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "358dc710ddf909826dc7de62a1004461d418da7df6ee97f6f3bd341040135556" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "87879edc4455e1359627c5b03cc3cff54ef2fc3786994cec93b22ccd0be76c2f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a51197f6fb770ecfd61b35a7f3ca226a7d34e0dea35f4912380faad1ea6d2df1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2064+b5cafe223.tar.xz"
  version "0.14.0-dev.2064+b5cafe223"
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
