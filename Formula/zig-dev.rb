class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "dc5d176498bd7fa9a10680262d889204344b0094b58b77127f8f01608012009f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2790d4eb622e5f19ac67ce6e2bce64fc226b1deea98f7f955a683f8614d8ccae" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a5b64771e58bd2e15d04affdafa2256ee7f0a6820991c2cb55c7599243e4c349" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2317+fdb4eb305.tar.xz"
  version "0.12.0-dev.2317+fdb4eb305"
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
