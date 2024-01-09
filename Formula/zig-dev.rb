class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a37b135b12a03224ea00d02d36397adeadfbabaa82b3f73db19dcf7e88058784" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e7248376ad6de3cd960b501843cc176a3d5d9b0d1017500ba10850754dac1d14" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9fd9bb91094dfa92d8c90f26ec0f7604f43a759178e3bcb3517b615a143ccbb9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2076+8fd15c6ca.tar.xz"
  version "0.12.0-dev.2076+8fd15c6ca"
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
