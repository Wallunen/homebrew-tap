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
      sha256 "0251a8414f98513a33a7a7bd1f6cc13fb59f391168a742eee47b8c685e9827a0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9121e3f03515a3434ef9f362f8c541540968316d33ed6485b2d8a31dc7332fe6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "afb3016a94a8b5608d364e58ec7b01111af775a020d5f93f69eaebde2053fe77" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3153+d6f43caad.tar.xz"
  version "0.16.0-dev.3153+d6f43caad"
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
