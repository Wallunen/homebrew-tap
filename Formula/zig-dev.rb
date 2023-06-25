class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c0ff6461e2ed77fbb61c390e794b2fee223e5afd40d0ed377448f3434840c20e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ac0606277c7afc28a993393dcbaa927709b50c546b5e7516da558f04dc65c9c6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ab32f9813624568c09b6e81af0da9e562638364cefd04f2d96125306cfb0ef06" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3798+a5e15eced.tar.xz"
  version "0.11.0-dev.3798+a5e15eced"
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
