class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "29a9921bb0d5c50a0738c26b6131416ee3cc5b64f1aa5764e3622776466667d0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a7a5fde637ffee870b998786b609f8efd5389d66b2747aea01e042604641a4f9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5ce5846a5e2fce37fe92598343f7c455661df00f16b6e069aa4e8abcff024018" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.126+387b0ac4f.tar.xz"
  version "0.12.0-dev.126+387b0ac4f"
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
