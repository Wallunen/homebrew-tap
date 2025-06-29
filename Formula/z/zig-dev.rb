class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bc6fedbb3bac9f7855b41eadad4df20a467a469f90409bc214dfb6d2fc82e034" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f53380db46b5e3ee3c5db408bc24bd3504ceb7ffbb085d1b61df948432381af3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "648473864cb78c9e31982b18efeb318496fc422b0a7a4bca5afc027b8309a04c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.15.0-dev.877+0adcfd60f.tar.xz"
  version "0.15.0-dev.877+0adcfd60f"
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

  test do
    (testpath/"hello.zig").write <<~ZIG
      const std = @import("std");
      pub fn main() !void {
          const stdout = std.io.getStdOut().writer();
          try stdout.print("Hello, world!", .{});
      }
    ZIG
    system bin/"zig", "build-exe", "hello.zig"
    assert_equal "Hello, world!", shell_output("./hello")

    # error: 'TARGET_OS_IPHONE' is not defined, evaluates to 0
    # https://github.com/ziglang/zig/issues/10377
    ENV.delete "CPATH"
    (testpath/"hello.c").write <<~C
      #include <stdio.h>
      int main() {
        fprintf(stdout, "Hello, world!");
        return 0;
      }
    C
    system bin/"zig", "cc", "hello.c", "-o", "hello"
    assert_equal "Hello, world!", shell_output("./hello")
  end
end
