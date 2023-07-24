class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "23b8f655a0a24ca6c266aa103957db85fc95cf1a51f5beceed21b26d0ded1806" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f7bc1fba4fb861198a6f3f1a0f7215bf98e8c3b4135682da2bcf7de9387a0574" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "da7e2cc5b9999ff1bec1673d889805b73c0e58674ec8f66d4bd239268413eee6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4195+7f3fdd2ff.tar.xz"
  version "0.11.0-dev.4195+7f3fdd2ff"
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
