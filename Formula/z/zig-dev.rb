class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260413-095032"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1cb646443cdd536609e5cc69894083ab997498219ffb80414d4a961fbacbf8fb"
    sha256 cellar: :any_skip_relocation, sequoia:      "be0e3c7359d792ed9c0282c4c127ed070d25e04e827c891c309396adca67d6ae"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1f69e868acc22e1a68362309938245e90c76129c3cd0a18078b64f74f3c44539"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c01a49b5fc1fd4ee32d518fab1c22b8162b5a3cfb28071b75d7989d65b7d00ba" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a924165f5ab4d70a12e60109fccabb1f61d2b8a16b5c8cdbc32450f4389f04f7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0b7617af16610f1d56ef12cbb96b8d4a1be349257d4b43cd1a30344eac204bcf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.9+046002d1a.tar.xz"
  version "0.17.0-dev.9+046002d1a"
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
