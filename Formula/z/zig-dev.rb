class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a663e3711cd180b7c013ed4819a16994f410cbf48c2ac15d9e6c457db4f96069" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b8c0c30b1023f06a149f8939c3ed84bb4691e23e4260fc68f9622f1068543c92" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "05a365431cb970a1233c1b623ee682a042423ac9a7cbdd96cf696234312e25e9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1904+e2e79960d.tar.xz"
  version "0.14.0-dev.1904+e2e79960d"
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
