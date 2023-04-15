class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c8b74682f2b1f7dd13692c5090e1ed16b706725a7aa89885f57fafe05bddc597" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8210e61713bd8330ca69927a460f734154b79354297db954d63105e7094d523a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c668b9c3639f1ecb31582fe11a74bfbbedd08802dbef408ff3597702b9e5d0e6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2613+b42562be7.tar.xz"
  version "0.11.0-dev.2613+b42562be7"
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
