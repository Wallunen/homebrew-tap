class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c5ad3c5d1ab711d6647018755f89d9296da0659ce97269f3e32a049b613bcaa2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bc122e652f8325e00473efcfe5736a856dd5a22321119ca847719441c20d2820" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "187cedc2c1d9e104c328bcd605d1ebf64fd41b4b89a3ed14c648e297b8330a2c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.983+78f2ae7f2.tar.xz"
  version "0.12.0-dev.983+78f2ae7f2"
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
