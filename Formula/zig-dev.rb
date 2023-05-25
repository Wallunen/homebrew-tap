class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5f3647ff8e350b5660ad825b71089d58194229b1365c3475d74ac14a1809a190" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4f1bfb280071ad0c6e2ada21b5bb5985d973b82cbe931d524f76891a628cb845" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "117646ac51c78a87b68aa1c7ef689b3401f4efbc222731fe45e29c47d630448f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3295+7cb2e653a.tar.xz"
  version "0.11.0-dev.3295+7cb2e653a"
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
