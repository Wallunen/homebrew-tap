class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260728-020213"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a22ced0cea15b950734bd59b9bbf501597ee305cfbd9f793555feb183aca0ea5"
    sha256 cellar: :any_skip_relocation, sequoia:      "8b9c17ff97a0c0f3c33f24d257eec07b9e23260a3127b1fe615b169bcb56cfbb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c37cabad810431e255e298137167a2c2574ba25b54f8f1f3d9eca58a13ed8695"
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
