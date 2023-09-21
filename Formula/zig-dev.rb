class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1312b76e7f7185a81addee45dc401e90d5d9d8482b3ee861696a5e843ec907a9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "311d134a14923f6b0837d2218a99709d5c05eb2526490edb42d2485879aeb48d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "788ba308f605ab85c67f52d2b10f34d438b33c9b68c65aa366ec59c76392c410" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.464+a63a1c5cb.tar.xz"
  version "0.12.0-dev.464+a63a1c5cb"
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
