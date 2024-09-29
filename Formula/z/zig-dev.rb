class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b5bad785ab416ddbc6292a7cc64dc9ad24fcc1f11977140429db7e58ef7462af" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4255bf3f32db0859fac955381431f39de78f497aa93012998547977395d00d32" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "eb98730320f86b157c40563d962729a52db8a1d2f7038038b097ea360ad337e8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1693+0cdec976e.tar.xz"
  version "0.14.0-dev.1693+0cdec976e"
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
