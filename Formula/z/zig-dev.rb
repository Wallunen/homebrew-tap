class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260822-005446"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b03a112d60504ed4f9a2caaf71c8443fca8591d7c454bdf23436f28893800f0a"
    sha256 cellar: :any_skip_relocation, sequoia:      "40802bf1cec20ec95fe4de70d3625af3f33f4ec4f6201fbc15829b3ace8d7c41"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aaed3b9318f3abb3e483048cd2562ed0d685e1c7d3ddfae0725c37af82a1c5a4"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "90468141517363cfb93c9aea18c3733ad4534f5abf71188bf8a10f42bff4e3bd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7f8b084a7fd776a93bb45df36ee966402d260c955f2ea567ba7bde6f38e94ad1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0825e4a55baf4a6647c3ce3077a7236c9ffec5b17e1ca0102a930fe33d631bc6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1857+3c46da14d.tar.xz"
  version "0.17.0-dev.1857+3c46da14d"
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
