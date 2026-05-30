class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260530-165621"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "55b924eb895659632bcaafc6f8ee3fc9ca9e10bb1313ff956fc7b65b12b6228c"
    sha256 cellar: :any_skip_relocation, sequoia:      "e6ed73e551d20dea83f163ba5da38cff2e4ac5fbc30c271b32d66a4956e0da4c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aed1bec4229c6e53b5ecb84c0deceafdf277820f1f87640e8a71d91be06e4958"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3315ff00c1d90d2472c1bef7b583e3a1adb4b9160b3452aad828b077ad7dd5fa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4f3143fa5a9723754b9516be6f9bc23fda2743abf1144570ae67ac875f5d2a09" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "19275107de7b89ec33d29b50f00997c1381c524d1e33b728472dcbd551da2e33" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.607+456b2ec07.tar.xz"
  version "0.17.0-dev.607+456b2ec07"
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
