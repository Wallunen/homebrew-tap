class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0ebf7154bd40e4053592dfa87774c0de071c173ca0223bc1461d1708a03c9ba4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a374dcf58b7a3c1d2a14403dfe00f6731d17fb16eb171777ac377455f0a054d4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3b8d6221cc4c2dec2cb0fb7f3270449f8a9d8e8b4f9d5f1830c2fbd8ee542a56" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.602+15ce96525.tar.xz"
  version "0.12.0-dev.602+15ce96525"
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
