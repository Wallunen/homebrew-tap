class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1ffeebf444687ec566b4d72b6e7731aeaa3ba401d20390ffc430d31b5ba8b103" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bf012ef948ba311c09120072e7d1022925c2578d1ab783e2ed980040ac53f10a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "031ed087430f72d0b6f45e178488c4ec10bb8573f66b0f2e72e2800c3dac1de2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.39+f6f7a47aa.tar.xz"
  version "0.13.0-dev.39+f6f7a47aa"
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
