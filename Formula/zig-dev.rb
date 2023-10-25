class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "222ba7670668f294a841a50f6038f90b1acec14b3afb5683ab98e3f84131a75e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "13958fc16b94aadc0144f6720e1a70b3a6e4cd8a3a5c8957db0be8006262d318" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "953b277e727be4a81a09091020dce2fe2cbfe24d4a890a89fb144b64bb41cc87" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1261+bb0419599.tar.xz"
  version "0.12.0-dev.1261+bb0419599"
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
