class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c09ec18250c903c974effbb9eda0ff0f9f5ce44bd7730bd67b0262356fab2a2a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "09765b251b6f7aad9ef6090b04f8102c25c4e4f3612ff8f32dd1d7611644d6d5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b602c25c4358f4be62abb75102fa8f67c97a600ae934307aa41de0e3b7be7fba" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.40+1a6485d11.tar.xz"
  version "0.13.0-dev.40+1a6485d11"
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
