class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260422-091435"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1ea3071e6dc3944018ef84e16605d64259b41564c9a60c4c201fc6bab3947a90"
    sha256 cellar: :any_skip_relocation, sequoia:      "32bcd6e8cf4b4b3b2dfabffc704d5a0f3d913bfbf44b7a84ae71fd98bc641892"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fb7b05fa74e9604ec092815774cef20374ae8e31b87270e612fecab4159e5930"
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
