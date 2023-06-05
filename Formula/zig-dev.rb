class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7f81ec5e18230e9784932bdef29dbe17b0612180b2dff3eb482a7bcaa3473327" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "48861c75e935bc838fc224d1ca5861c825d1e33f74653955e1cae7aaf9c863ff" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5d508ba0a1bd942322f5c592beb60e72615c69c6b432f193d37ce05dad4aa2be" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3380+7e0a02ee2.tar.xz"
  version "0.11.0-dev.3380+7e0a02ee2"
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
