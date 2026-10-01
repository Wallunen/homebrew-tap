class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260930-033650"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e5fc8fac4673e589bb171ebf7ba38c1bfabe6404dfcd1fbb888a3fe40ec6a08c"
    sha256 cellar: :any_skip_relocation, sequoia:      "55f8725cb234596669f0c9b5f90b2c105cca44b74873d34e3c9b848e78fcee54"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c5426fb7a4b18f08460a8bfbb7cbb15bb2b883d3cf73f307a76e8d68b933af3e"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3b60e1c0345578ee83e80c94646fd2615ddb13e64fa979b7bd5bd5d476072d1a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "251ef0c623e52896f7e946dc104ec752f0dee4f0a17e4dc56d9afbee939aaab2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f10e0586afb4a57912b92ec271f6cf5de5adb507635d53101c7b3a2713f9db27" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2375+d8aab4878.tar.xz"
  version "0.17.0-dev.2375+d8aab4878"
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
