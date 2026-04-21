class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260420-165916"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8fd7b4d77f6bce618f4c04f8007e096517184d6f1223783cc2a4a86c9d51c9c2"
    sha256 cellar: :any_skip_relocation, sequoia:      "adecdcc3f7e7abc46a3aab5a19f3529749af9e44b680b260fd653ed6526f7155"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f77b58f19bd8cc6bcd03bd07fe2421b713dbcd3d7b2f895ce3518e8b06999fac"
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
