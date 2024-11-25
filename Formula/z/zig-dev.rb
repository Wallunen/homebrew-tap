class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d65f64571bc8a298f7cec42204704d4662171b8dd354cfb190f96404ad73cf9c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fb4fe9ad50c1b284239754a1213fc30b04b837796b7c4d5df1337896e7835e2b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2a4db41167417a1e097738d54edb0793eb5a9f7a1a2cd593030b238517fcd28a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2287+70ad7dcd4.tar.xz"
  version "0.14.0-dev.2287+70ad7dcd4"
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
