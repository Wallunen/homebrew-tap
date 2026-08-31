class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260830-132820"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8915c955a6fa7f9c351f0f4d93954bdcf66c15caa0943d63e3bea1c49c4e5538"
    sha256 cellar: :any_skip_relocation, sequoia:      "b139114e9b58956fdd6a05017a68862759f008caaaac23d5f392428f284a2651"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "718632863f768f57feadfbdac450f5b438ebbfd99eb1c2d05d1085c3916e36ef"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0cdc08fadecb11d3abd78c0be006a02cfd03cd8e565ff1c84e12cf9d9916baf7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7624bef4c57dd4608930f77334a87778f9335a8051d562b7b43ecb254d683489" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b2f6b2fa2cd462c10c86fbb160099c1c8848d2d5bc0c1e0c2dc28a73313902ff" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1941+71115f0ab.tar.xz"
  version "0.17.0-dev.1941+71115f0ab"
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
