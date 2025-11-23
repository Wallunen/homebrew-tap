class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "71edb365afb63b3b9c7ff191ac377f44e498d3c1a7191d2196090e6fbd2f9646" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "19b354ac04a20152410a774c90c3c15b9b5eb1706f2421ef4206c693f73a4f24" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "17df61b8651d4e3a47f9ef1f7998b61157e61edc429322f7266b84ead5e73ed1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.1441+2ea55d715.tar.xz"
  version "0.16.0-dev.1441+2ea55d715"
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
