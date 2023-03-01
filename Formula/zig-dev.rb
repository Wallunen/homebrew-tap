class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6b1cd0ca3bf2c95f6f2d961e997eaca9ab44c1121f0be3830e183f5ff8b945ea" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7d45a41a7be7de8362e7ae4b30e2aae69aaa94d39ec5fa70a85c20a81c515b50" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1940bc29421c103680f19de4906f6895110405e6a218586c86e78f1305456496" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1822+98508a12c.tar.xz"
  version "0.11.0-dev.1822+98508a12c"
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
