class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d372c07df3905e1b18dbd75f29accd61f2e0456c269ce9119108e7c2ee89b7dd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0499f1e9139152a3fe36c8f0534e1d8f8633b0fc20fd1d82c6870cab6c25c531" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3d82dc356441943b67fef369ee6d590929f9a8ad22816beb0cc96f89f895c548" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.39+1b728e183.tar.xz"
  version "0.14.0-dev.39+1b728e183"
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
