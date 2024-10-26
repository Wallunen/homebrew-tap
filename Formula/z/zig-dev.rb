class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "dc2852d420d7a18d1e42f435b69da7f32ad14f62a004f36868a17245d28f0ffe" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fafbc49cd50bbf279418688a2f9bbf53dc2007064bb29bc347a627a69549031a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d7c0d3d7a3b3705b17390f05153c936d2d16f4d12343371d61ab078e20bc883b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2050+4adf63aef.tar.xz"
  version "0.14.0-dev.2050+4adf63aef"
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
