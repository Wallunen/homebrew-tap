class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8575ba9b0ab824e26b5b57789d5bc5e14b64070ac5ba0eee7ff950f0f6b54c5b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d55999d0dc6f99cc4158f25fbda8cc35c82108c23c6556950a53dd8a9b58fd9e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "af42a3b20fcb07462999dddb18b0fa5dcf5e2d07dbca2695f717455a52ccce2d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2780+51e96a823.tar.xz"
  version "0.12.0-dev.2780+51e96a823"
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
