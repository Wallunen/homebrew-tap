class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260720-022936"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "48cbbae92c7f37c8632650a485c3628fad6c944a94fd0b4bc4bebeec184575db"
    sha256 cellar: :any_skip_relocation, sequoia:      "dd1839bb02d7607aae849df90a1bc0225c1131424251a0b0f81bad5edfb5a802"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b1f78e8e8100ed1d46b87ae569436f8bc2399b89e4ff133b3da0c3fb9642dd71"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f5d2b1cdfc048214316fa5b9e8c915aab802a7bad32d95e278918be439538fcb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cf138c614ad916fb7c0c3507e5d5d54eb7bc45695785bc63d9fb7f4107d12eca" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "91281bf3deaa1d8055b0ad7b3b10c29e7f1f9db666fb5f5182440b1f1d3e722b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1426+58a94eaae.tar.xz"
  version "0.17.0-dev.1426+58a94eaae"
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
