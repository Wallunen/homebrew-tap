class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a7c4af72aa8809e770bbb4994e4ea7ddb67144f28b842b5f3cb16351041c7421" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6f6ed0ab188c19fc5d5f299d139ce4c62f2430d0a4eae6659d78916ed32197c4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ba6522dc6d36d250098177f1071467532301bbf2fb4f7a4a52beb9aff72b0e67" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2399+d92b5fcfb.tar.xz"
  version "0.11.0-dev.2399+d92b5fcfb"
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
