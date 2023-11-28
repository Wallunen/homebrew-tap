class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "91ef7942d503a80505e6cfeade68616762ec0741dc8a826795b3b396c3e67975" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "15f5af18e0cc63fd76932870d93b75a6590ed0620ab3085d4d0215e6e765a062" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7de1c9ad753d0e87d7410fa81c15bd6bd060f0d608a2e20781bccef448484884" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1751+7fbbeae61.tar.xz"
  version "0.12.0-dev.1751+7fbbeae61"
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
