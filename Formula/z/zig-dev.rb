class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260928-162151"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6d66eb312470d94939350beb3ce62e2d00cd2c8afb365b6618dc476a90d87a6f"
    sha256 cellar: :any_skip_relocation, sequoia:      "2045fa0fcd8adaaeccee34d447c035810f0dadd7d611291a940ef2ab284fc065"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "265985d879d889fafbcdcd9461943c9d0a0c3de90a008a59a79ae89d1f549b20"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f965d20b7118151a73da37a251d24dd696d1f025aa702110e8c1433eb1d4bf36" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "30137724168da4577508609cc3cd648db3ca3a841cc034e6e3c2b34b82be7079" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4668738082f1f085ad072eb3306b7bf48d6350c95b99ae20ace24c1f16747490" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2320+1e770dbef.tar.xz"
  version "0.17.0-dev.2320+1e770dbef"
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
