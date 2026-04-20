class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260420-020937"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f9582679fe188e5ab7967b1e62106935f5c2fe20e8b86b5f74765aea89908c3d"
    sha256 cellar: :any_skip_relocation, sequoia:      "519420d11ce561545b0d830adc1ce9ac799befd3323028ca0198e92f62ab7ff8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bf93ba0d08295da2662b5c5efd2ac5080ccf733c5c78f1645167f37d39f5d23c"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "54c568e957e9072a7bd02be131d03962123ae6c959959a417c82abcd8613c313" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4774adbfc42dbef22362562a943abc3f685eb3248e31a6ca22c2156d09405ba0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e5b6519775911b5fdefb3c90f26dcd63ad5dc02c703071793c18f9b403e7aef6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.44+0177cb57c.tar.xz"
  version "0.17.0-dev.44+0177cb57c"
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
