class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6b7766567953b49f19a5c618e3d20d0e4813bc08c5cb25cdd9197ccc827ca750" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cef8de365819c293c7abeac1b63c8510042ed2851fe2854883ab77db5543d561" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a08a4f31b3bf1f2726bfa3471fc0d8c3d8d3e5aa2282907317e5a67a8ddb9866" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2571+01081cc8e.tar.xz"
  version "0.14.0-dev.2571+01081cc8e"
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
