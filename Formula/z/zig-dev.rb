class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260728-172136"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "94be53d67853e65d1e3243c14321d01d9b9bcd943bb5b4afd6a8b2cca1ee9f45"
    sha256 cellar: :any_skip_relocation, sequoia:      "a064db4e26d03bec25499aac4a4e15c41314521afbf480f1429b84fc39714de4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8c9ce099366830485fa076dc9f3cd844371675226dbdfbbda9451ccf266fd2c1"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6e40bf9c32e4f07e12f26b4af1e51dcf9511e534da193bb807a24594d41fb6ae" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e75b0d9784b1293cb08ae3e9aa9edd7ee2012abb4138e3d2a1c927870d62f7c3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "209ca7256eb54cfef1e607043d091ca997a14c6e191546e52f18ded09df86ec1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1476+91a29d707.tar.xz"
  version "0.17.0-dev.1476+91a29d707"
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
