class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e522d43aebf6ecd0b6d5915943262f291748ce746fa400c666f285e5f8ed4e1e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e38840cc7a94d422703e82112d54fb3f2a8da875b0ea3b8ee428850f0bb718a5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9f09caf8c78a3c2a2135a7f9666fa866e2c80731cce39d22d17145570fdf5214" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3301+230ea411f.tar.xz"
  version "0.11.0-dev.3301+230ea411f"
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
