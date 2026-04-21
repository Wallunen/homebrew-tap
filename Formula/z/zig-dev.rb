class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260421-092003"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "730616a63f5bc61bd0eee11a982dcda030b11fe68234abb1066de1641423b0ad"
    sha256 cellar: :any_skip_relocation, sequoia:      "0dcc185b328d4f304eaff115f756e1296935f276213cddfdf409c5d73fc9a70b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5478ea97ca259ad1f310f88aeb87635f48a7544bc6dddc579de788254ba75b6f"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4680602790eb599f6113f301418006751232862eb1c86653d0bf440aab3d9b14" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "239a93ffd529c94d6b2b71d561573153e321db5f34d5cb52b40b5d592a75d0e9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f9fcdd6ab5eb5850d2805446ce20504b7eefd567f07b64b6b7ab143536f6f576" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.56+a8226cd53.tar.xz"
  version "0.17.0-dev.56+a8226cd53"
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
