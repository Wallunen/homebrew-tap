class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0881d912030ceb100775adde38b22d30917ccabd679ecc803f937518bb24a6b4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c239a6d9047e07ee6f5aeeacb825fbdfd57a3759056f06edba55a416e96f400c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3043ab6c2b4e70c1d10f1556a185641d73e3cae0d132bb7a46d0695e3ff1aebf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.15.0-dev.848+f3940ad85.tar.xz"
  version "0.15.0-dev.848+f3940ad85"
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
