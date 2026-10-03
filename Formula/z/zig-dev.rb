class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261003-185629"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1461d41ccb783baf100fb4b17578086abe961c8ccb18fb1954b0b732fb83980f"
    sha256 cellar: :any_skip_relocation, sequoia:      "2beb47aaa4590c351df629db2945f984570cdab90698c987fe625d84c993615a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d62b0c5b3de73887a49b6e753aaf5d51f9e1f9c2be692aae29c2b3d3a55def76"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "09d2af1b44d6d169559cedc21210ecdf45a1bc7b69600de12d33633c5d7ddf8a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e31cca4f907f97673e733c8d457c2c9709953b44c372d16e9f6b66d4629500f6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a31532218e7aacb53fec6d25d0f5ea05de4ffb083fe2bceed0e64aaeabb6f786" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.18.0-dev.1+a6c6412a8.tar.xz"
  version "0.18.0-dev.1+a6c6412a8"
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
