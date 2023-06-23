class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "52e177a70474323de64516ca2c498548d6d567260203cec4e56564b608898bc6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "35068a6b133b000cf8343da0f5e25adc3f1bf7b085b84c5a809e87fdc2b701e2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "db1de9247cab28873a75d6e93eb702d003271932d719d7be2ad6f2df2d3a4ed8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3773+438d68091.tar.xz"
  version "0.11.0-dev.3773+438d68091"
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
