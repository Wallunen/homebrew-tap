class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260603-033606"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "63ed1a72fb435a24caeeb1db996bda593b399f7d9d16c27c648aba46e7addd28"
    sha256 cellar: :any_skip_relocation, sequoia:      "a98b0e71c0ddeddad921c6ac1bad0a00ee9b88f1daacbe2dd2ed62bbb3a83ef2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2bf30f8edf36f705d2541411f72e21eeafccd50755ca9ac6d2df279b407fa92b"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b3939a41facd0bb96bb44dbd1981fd6c42a0386dde512586e365bb35168fcbba" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e67f8b37c263280b7c00a47cff809ccaa4e0f2884010b5291d8ac4b788e184ad" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "986e68c1861458b21ce9229a4d094d8c14e1e1cf4b1a60f28e4dfb70b17146f7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.667+0569f1f6a.tar.xz"
  version "0.17.0-dev.667+0569f1f6a"
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
