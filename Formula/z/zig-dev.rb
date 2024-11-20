class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fb478808cd438f41ca6b7082e9340249e55311148a4c2e322d4c068fa8b7d857" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c52feb4aee1859f8bf5e224f664a598d886151bf68b28bc80a924ca438c71718" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b0b6dbc0623fe85120d17db06f4af2f12dc52882f0b6dac69a1af63ad9b19ba4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2262+dceab4502.tar.xz"
  version "0.14.0-dev.2262+dceab4502"
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
