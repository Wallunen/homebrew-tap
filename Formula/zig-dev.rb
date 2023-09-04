class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ac1a3afe0c276396eca15aef09a9379a3e4292bdd63a178e61108f979db150ba" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "de6201a0b9cf8275bbf8c1f88275b1de85dd9eb54bb6eecb7203aba7d600f2bc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d98f840df87fb864d3615b42f52767b53f7479653049e0dd6bca63bdf852caf1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.262+3cf71580c.tar.xz"
  version "0.12.0-dev.262+3cf71580c"
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
