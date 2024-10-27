class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "132531573c1ad670eebc8dceae28edd728ffe3ab01628371319c3b4bb1d8b3e3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "18c74ada5b4e035229baa9730e15123e88f1a55ac2e1fcb9f3084ae47ae37ec7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2e384c0d7bc18237edadd9b1e0e41c77adf2d3459ec974580f49014a01e9543b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2051+b1361f237.tar.xz"
  version "0.14.0-dev.2051+b1361f237"
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
