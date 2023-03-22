class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "77ec6432802e5d821e44c160cef071c7a4e822f74545b5a38c4225559a20e100" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b4e7f7a82efde9d79b0f2265dc2ac68fcd6bd7da65960b50a5996aa9c2e2efa7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7eb9c7cbc1a212f6fa2a73910b2a5277e15a2a9f573fc405da2b3d0bd49ae937" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2213+515e1c93e.tar.xz"
  version "0.11.0-dev.2213+515e1c93e"
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
