class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "be9de5ddbb170647efa5917a5708cc4c94c03c47300ea4526d4bd26b4cedcde7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "83269cc83ecd07098b398ce2294cb269925e830f103f9df08c1dcef691e6be05" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "35791307e9e4a25f99595a4f38bd6fc6a6c7cd15ca2fc1803198aa0f31ff3724" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2775+21aa55d34.tar.xz"
  version "0.11.0-dev.2775+21aa55d34"
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
