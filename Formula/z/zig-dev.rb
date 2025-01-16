class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e48acc353d6ef1a28cd8eee119f2d20a0692ce78aed605b84c23b3a4b2aa9616" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "de00c5cb1d4cc914f81d31ab512bc7dc2efa9a76478c8c243556cdeb93d2e002" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b17514e642377a0b89b0740cfafc531e51dcdffff08fddfe46d834b7dc42c362" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2647+5322459a0.tar.xz"
  version "0.14.0-dev.2647+5322459a0"
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
