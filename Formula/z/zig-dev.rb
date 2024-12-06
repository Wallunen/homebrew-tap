class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5285ac09ce425d606e6d6b577a50e817cc31a83e9dada8bbd42183e26531197d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fc0b3a31f219887abd115a26934f0e6e631ba3855a3a509186684126225908c3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1769a16c3217835b710b4e67253af6bcfc56ff15aa2ee94daf666f174077f026" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2380+c9d6f8b50.tar.xz"
  version "0.14.0-dev.2380+c9d6f8b50"
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
