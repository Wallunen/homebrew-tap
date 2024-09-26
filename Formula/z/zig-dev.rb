class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "34d0807d1852c312abe9151001054087df9ad6334996e1b77d6a1819389edadc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dca362feb94792641a2badaf1769509a5c16feebdd36636c959c277f8fcc6529" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ddae94ddd1e0a19437acef2e43382d6b12c706941f29b312b610cbdf63f6dc2d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1655+4d09fb491.tar.xz"
  version "0.14.0-dev.1655+4d09fb491"
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
