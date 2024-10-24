class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1b0fd4fa9376357a8044ce4065bde9195168fa6931b2bb63e2ce3ef9ff15b48a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "00b0ac7adc74918e3b397d24c5e5d4cf046cd06b5e8305763ad6c2e7b90593ae" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "78bf6bb3771d8222d9419c568f904aba2e8a0d77dfa892f04f9bfb48b7998d3d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1983+6bf52b050.tar.xz"
  version "0.14.0-dev.1983+6bf52b050"
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
