class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0ce6f4066df9046497d46c6222a65d57f03ed779015e815fa673a8ba4d2e1f17" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a851bee589e41c9dc4c503961d8be2e636ccf9160c475c85f5e3c9663f42bb8a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "22dc84114db1f3788234850e716ed0a630caa7dd89b65512821354211f26adea" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1482+e74ced21b.tar.xz"
  version "0.12.0-dev.1482+e74ced21b"
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
