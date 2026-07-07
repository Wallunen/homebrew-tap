class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260706-180645"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c7c6fedb798342b4b429317e1a78a8d6141f792cb58009e67a387bd8e9bc550f"
    sha256 cellar: :any_skip_relocation, sequoia:      "851f3dd300b0e91c7cde94d1dcea8818c3d6eecc43eeab7b65e87591a82d438d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "944b4217c6336258ce83b7bb2a0a5344420515a984797dc5d8aad89fe5cb6d35"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7b26b0866fd01a7ef13ef56d01519882efa06b8685856fd5efc48c16dc25c4a0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a056e3912c3ce48b1f43df2af38968fff9eeebd0d028af31fb31fe74db09ebbb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9708590c4761a8fb37b12f62403d0fe2768c5380fecb106041990e336f5f4cae" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1267+300116b02.tar.xz"
  version "0.17.0-dev.1267+300116b02"
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
