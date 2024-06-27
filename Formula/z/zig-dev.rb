class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "813f8bafeb554238611db1eef1e374b84e307d22b71c5cf64bfef0480c587c1d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7350b8c828946f665194a46465d9642ae9f3537f0f18132ba6550a910ab30f33" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8dc9f290b9a0ae22ec501e15f8888b5ac16d2e8a3e518ef1d0af73d61665c661" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.125+a016ca617.tar.xz"
  version "0.14.0-dev.125+a016ca617"
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
