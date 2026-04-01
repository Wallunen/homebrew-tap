class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260331-085132"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e6286ef18c9ee2b37d8cc910075a2d30cac44e7057f186e05be20b3086569133"
    sha256 cellar: :any_skip_relocation, sequoia:      "fca5c06c17a594c2d7e537d6b435b1ad4c2f642cff2328e02ab696976c406611"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f22e3aeef7b4c2d15f9c45594125d49dca42d32f47384384cd360f12c31f21e6"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "93657cdfadd57dc4d573634ad989a8d8cebbf20d2e7f84a393cf09bbe1a26101" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "368125b2996d69eea3b2612f8adbd504675d9aa8462b34d5c1a798df705c1b65" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a3180445be902d177e137f5352efa0d1733eb7f0061c12b40363bf173d5a4518" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3059+42e33db9d.tar.xz"
  version "0.16.0-dev.3059+42e33db9d"
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
