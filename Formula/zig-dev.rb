class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "138eeae46d95e0b23e80c8d852d75831e153eacead5f838b01a76312c5611dae" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "608f1092d0321578498a6e677caaf6cc411954c1c68cd3ff1008605b40c3b320" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "aab7f3954c8a07d2a24757d5966a9ece618d53b72c2208a8b731ed7e40bde252" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3435+091aa54a3.tar.xz"
  version "0.12.0-dev.3435+091aa54a3"
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
