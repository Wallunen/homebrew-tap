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
      sha256 "d675cfdf903206f4bbd14d56e2b8aa5804f321f1962eaebc535c08266e0f8427" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e91ba63b57e9c0fc6c4a26121690816d8b45cb7a8d1711904d9f4211229e94f6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "06635dc339ec7aa652087b9d96e5ba93c8be6b4f8a8bc8baca1670902d200718" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2329+1b7a78122.tar.xz"
  version "0.17.0-dev.2329+1b7a78122"
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
