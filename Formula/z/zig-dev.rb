class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260906-115237"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1c5fdf466cf7a72697b404447c343e2b25d43d072231b60480b62dd5bdd356f4"
    sha256 cellar: :any_skip_relocation, sequoia:      "1404fdab32d925b6d93bdee225e9793d157608be6cea5c75cf8fff44b93efa5b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ee83324eae7860b604fa1fdd49d38905ffa16ca99818a6c18e95dc6fe55679fe"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "64b055c1f00414f83a9226e592058da04e349ec019d95bc360b0b7e784245ad9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "046224530c77221ba35521b127e267cec4ec0b98e6efca5b84fd1277dd157b3b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7d591c41b29b463c226661bbbb4e4f95676ed9318a31f7bfafc1995c69a99129" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2018+ab30a0b9a.tar.xz"
  version "0.17.0-dev.2018+ab30a0b9a"
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
