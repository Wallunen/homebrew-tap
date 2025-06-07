class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "65205ed5a6a518c4339fd98b21dd3bb391ec86888945a27c134f6fb50e7945b0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f72a206152b6e07542785e598ded14dcae153c88af1a2741ba7480ae15932a72" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e6b0b35b0b58ce7abd6bd9e3529ae886b0b06ab7b235d4409439779a35bd45eb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.15.0-dev.736+b6d904624.tar.xz"
  version "0.15.0-dev.736+b6d904624"
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
