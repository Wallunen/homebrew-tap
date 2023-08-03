class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8ff3bab159327211564ba74245a38e4ac15684003f69abbc1624d0d47642166f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "52022c9876a7d0e2f97ec2d2bd3990c3c8058501659e9e67cce24daefaff4718" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6de6ff177e17b984720d48cd700c4e473e35979159406bb17bd4bff964ee3835" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4408+9e19969e0.tar.xz"
  version "0.11.0-dev.4408+9e19969e0"
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
