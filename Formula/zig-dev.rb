class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f79ceddc6346460dd2861cb88299ea37f2402f4434adbbb4d06c6467d9cd8095" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "34c9058d95262f0c90fbf3938892833651eab35947d27747597ab1ff1585b8cb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d7ac81c585308de21ceaee6f92fb7b59533bda533192738a100cd4c9289f3071" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1594+7048e9366.tar.xz"
  version "0.12.0-dev.1594+7048e9366"
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
