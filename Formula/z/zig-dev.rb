class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "184b4390114a4025bebe5655b65710578ea5d86e722ed40087c2dff421c2841c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3760dea7c26d47998f43375216797dd9a2399a5f3d8f5bb6c395812f409af7f1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f1b36200c78c0e0a6f72d9c2f34da122bd9d163fc2ba5fc0237fe4f3521b444a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.15.0-dev.1413+fcb088cb6.tar.xz"
  version "0.15.0-dev.1413+fcb088cb6"
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
