class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b4600612a1c70c0c49888e3b9994b63265f2f451ec36afe722562949764220f5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dfbb7f49d6de5c6dffb976174a152f53a1484b58a2e0f13dfe10439c55912dd2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cf0238671b7a55b84dc2de20a67d96b6c69d658cb8bb141f87d798b7cc1efc36" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1855+18e6d1e81.tar.xz"
  version "0.11.0-dev.1855+18e6d1e81"
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
