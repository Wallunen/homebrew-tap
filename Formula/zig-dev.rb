class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7c9324fb09280737cb82abc55cb750ad10a6b99638f6ed5001d8a50e2533162c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6d170271ed6d82736960f7d46f67a0cf7f33146fb0cb9694b5cf3e4555352ee6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "40629251b10d9e134356c7ca3eeed8ca5ad33d1da80b899abc8486951fe9b208" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3198+ad20236e9.tar.xz"
  version "0.11.0-dev.3198+ad20236e9"
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
